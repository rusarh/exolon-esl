#! /usr/local/bin/ruby
require 'RMagick'
require 'ap'

STDOUT.sync=true

class RAM
	def initialize(file)
		@bindata=File.open(file,"rb").read.unpack("C65535")
	end

	def get_byte(addr)
		@bindata[addr]
	end

	def get_word(addr)
		@bindata[addr]+(@bindata[addr+1]<<8)
	end

	def get_bytes(addr,len)
		@bindata[addr..(addr+len-1)]
	end

	def get_word_idx(addr,idx)
		get_word(addr+2*idx)
	end

	def get_3_idx(addr,idx)
		get_n_idx(addr,3,idx)
	end

	private
	def get_n_idx(addr,size,idx)
		get_bytes(addr+size*idx,size)
	end
end

class XMSG
	attr_accessor :x,:y,:color

	def initialize(ram,gc)

		@debug=true
		@debug=false

		@ram=ram
		@gc=gc
		@font=0
		@x=0
		@y=0
		@color=0
		@no_walk=0
		@overlay=0
		@stack=[]
		@default_font=0x2530
		@font=0#@default_font.clone

		#        0    1      2      3        4     5      6      7       8     9      10     11      12    13      14    15
		@ccc=%W(black white  red  magenta  green  cyan  yellow  maroon  navy  olive  orange  purple  lime  silver  teal  white  yellow)

		# ap @ccc.size
		# exit	
	end

	def putMark(x,y,double_flag=false)
		color="red"
		@gc.fill_opacity(0)
		@gc.stroke(color)
		@gc.stroke_width(0.5)
		xx=5+(x&0X1F)*8
		# xx=5+@x*8
		yy=5+y*8

		@gc.rectangle(xx,yy, xx+7,yy+7)
		if double_flag
		 	@gc.line(xx-1,yy-1, xx+8,yy+8)
		 	@gc.line(xx+8,yy-1, xx-1,yy+8)
			@gc.rectangle(xx+1,yy+1, xx+6,yy+6)
		end
	end


	def putchar(char)

		#p [char.chr,@font,@color,@ccc[@color & 0x7]] if @debug
		
		return if x>=32

		@gc.fill_opacity(1)
		@gc.stroke('black')
		@gc.stroke_width(1)
		@gc.fill('black')
	
		# char_bitmap=@bindata[@font+0+char*8..@font+7+char*8]
		char_bitmap=@ram.get_bytes(@font+char*8,8)

		xx=5+(@x&0X1F)*8
		# xx=5+@x*8
		yy=5+@y*8

		# @gc.rectangle(xx,yy, xx+7,yy+7)

		@gc.fill(@ccc[@color & 0x7])#'black')
		char_bitmap.each do |b|
			mask=0x80
			0.upto(7) do |x|
				@gc.point(xx+x,yy) if (b & mask) >0
				mask >>=1
			end
			yy+=1
		end

		# if true
		# 	@gc.stroke("red")	
		# 	@gc.stroke_width(1)			
		# 	@gc.opacity(0.5)
		# 	@gc.rectangle(xx,yy, xx+7,yy+7)
		# end

		# @x+=1
    end


	def xMSG(addr)

		exitFlag=false

		x0=@x
		y0=@y

		while !exitFlag

			chr=@ram.get_byte(addr)

			p ["%04x" % addr,"%02x" % chr, chr,chr.chr,@x,@y] if @debug

			addr+=1

			case chr
				#chr
				when 0x00..0x60
					putchar chr
					@x+=1
					@x&=0xff;@y&=0xff

				#deltaY,dbX
				when 0x60..0x90  #0x61..0x90 (-23..23)
					# 0..0x90
					# 0..24
					cc=chr-0x78 
					@y+=cc
					@x+=@ram.get_byte(addr);addr+=1
					@x&=0xff;@y&=0xff
					p [:x6090,"%02x" % chr,"dY_X",cc,:y,@y,:x,@x] if @debug
				#deltaX,nextY
				when 0x90..0x0CF-1 # 0x91..0xcf (-30..32)
					@y+=1
					@x+=chr-0xAF
					@x&=0xff;@y&=0xff
					# 0xA4-0xAF=0xF5 -11
					# 0xAA-0xAF=0xFB - 5
					# 0xAB-0xAF=0xFC - 4
					# 0XAD-0xAF-0xFE - 2
					p [:x90CF,"%02x" % chr,"dXNY",chr-0xAF,:y,@y,:x,@x] if @debug
				#deltaColor?
				when 0xD0..0xdf-1 #0xd0..0xde
					b=chr-0xcf #0..15
					b=(b-8)|0x40 if b>8

					@color&=0x38
					@color|=b

					p [:xD0DE,"%02x" % chr,"set_COLOR_delta","%02x" % @color,"%02x" % (chr-0xcf),"%02x" % b] if @debug

				#setXY
				when 0xdf
					@y=@ram.get_byte(addr);addr+=1
					@x=@ram.get_byte(addr);addr+=1
					@x&=0xff;@y&=0xff
					p [:DF,"setXY",@x,@y] if @debug
				#serBITMASK?
				when 0xe0
					@color=@ram.get_byte(addr);addr+=1
					p [:E0,"set_COLOR","%02x" % @color,@color&0xf] if @debug
				#xMSG Loop Start
				when 0xE1
					loopCntr=@ram.get_byte(addr);addr+=1
					@stack.push addr
					p [:E1,"set_LOOP",loopCntr] if @debug
				#xMSG next
				when 0xE2
					loopCntr-=1
					if loopCntr==0
					else
						addr=@stack.pop
						@stack.push addr
					end 
					p [:E2,"set_LOOP_next",loopCntr,addr] if @debug
				#xMSG recursive call
				when 0xE3
					# @stack.push(addr+2)# HL+1 #+1 when next xMsh char
					# @stack.push @x
					# @stack.push @y
					# @stack.push @color

					# push X,Y,C
					# HL=*(HL++),*(HL++)
					zaddr=@ram.get_word(addr);
					p [:E3,"Recurse to ","%04x" % zaddr] if @debug

					x,y,c=@x,@y,@color
					xMSG(zaddr)
					p [:E3,"Recurse return from ","%04x" % zaddr] if @debug
					addr+=2
					@x,@y,@color=x,y,c

				#FillChar_X
				when 0xE4
					cnt=@ram.get_byte(addr);addr+=1
					fchr=@ram.get_byte(addr);addr+=1

					cnt.times do
						putchar fchr
						@x+=1
					end
					p [:E4,"fillCharX",cnt,fchr] if @debug
				#FillChar_Y
				when 0xE5
					cnt=@ram.get_byte(addr);addr+=1
					fchr=@ram.get_byte(addr);addr+=1

					cnt.times do
						putchar fchr
						@y+=1
					end
					p [:E5,"fillCharY",cnt,fchr] if @debug
				#setFont
				when 0xE6
					@font=@ram.get_word(addr)
					p [:E6,"set_font","%04x" % @font] if @debug
					addr+=2
				#put SPC
				when 0xE7
					p [:E7,"SPC","%04x" % @font,"%04x" % @default_font] if @debug
					tmp=@font
					@font=@default_font
					#set default font
					putchar ' '.ord
					@x+=1
					@font=tmp
					@x&=0xff;@y&=0xff
					#pop FONT
				#set POST_Value
				when 0xE8
					@no_walk=@ram.get_byte(addr);addr+=1
					p [:E8,"no_walk",@no_walk] if @debug
				#set PRE_Value=0
				when 0xE9
					@overlay=0
					p [:E9,"overlay=0",@overlay] if @debug
				#set PRE_Value=0xFF
				when 0xEA
					@overlay=0xff
					p [:E9,"overlay=0xff",@overlay] if @debug
				when 0xEB
					b=@ram.get_byte(addr);addr+=1
					putMark(@x,@y,true)
					p [:EB,@x,@y,b]
					# raise "0xEB"
					# zzz=*(HL++)
				else
					p [:EXIT] if @debug
					exitFlag=true
			end
			putMark(x0,y0)
		end
	end 							
end

def draw_xMsg(ram,gc,x,y,addr)
	xMsg=XMSG.new(ram,gc)
	xMsg.x=x
	xMsg.y=y
	xMsg.color=0

	xMsg.xMSG(addr)
end

def draw_block(ram,gc,x,y,blk_id)
	xMsg=XMSG.new(ram,gc)
	xMsg.x=x
	xMsg.y=y
	xMsg.color=0

	block_addr=ram.get_word_idx(0x4cb3,blk_id)

	xMsg.xMSG(block_addr)
end

def draw_level(ram,gc,idx)
	level_table_base=0x59f0
	block_base=ram.get_word_idx(level_table_base,idx)

	exit=false
	bidx=0
	while !exit
		y,x,blk_id=ram.get_3_idx(block_base,bidx)
		# p ["%04x" % block_base,bidx,[y,x,blk_id]]
		if y==0xFF
			exit=true
		else
			draw_block(ram,gc,x,y,blk_id)
		end
		bidx+=1
	end
end

def gen(fin,fout,idx)

	imgl = Magick::ImageList.new 	
	imgl.new_image(265, 200){ self.background_color = "black" }
	# imgl.new_image(600, 300){ self.background_color = "gray" }
	gc = Magick::Draw.new

	ram=RAM.new(fin)

	# draw_level(ram,gc,idx)
	# draw_block(ram,gc,5,5,idx)
	draw_xMsg(ram,gc,0,0,idx)

	gc.draw(imgl) rescue ArgumentError

	imgl.border!(1,1, "LightCyan2")

	imgl.write(fout)
end

# 0.upto(61) do |idx|
#  		puts "------------ #{idx}"
#  		gen("ex_game.bin","png/blk/blk_%03d.png" % idx,idx)
# end

# idx=23
# gen("ex_game.bin","png/blk/blk_%03d.png" % idx,idx)


# 0.upto(124) do |idx|
#  		puts "------------ #{idx}"
#  		gen("ex_game.bin","png/zone/lvl_%03d.png" % idx,idx)
# end

[
0x5003,0x5014,0x5025,
0x6d1a,0x6E23,
0x7066,0x6C78,0x7782,
0x7809,0x7890,
0x45d4
].each do |addr|
 	gen("ex_game.bin","png/msg/msg_%04x.png" % addr,addr)
end

