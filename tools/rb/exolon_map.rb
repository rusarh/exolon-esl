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
		@no_walk=1
		@overlay=0
		@stack=[]
		@default_font=0x2530
		@font=@default_font#.clone
		@debug_dxdy=true
		# @debug_dxdy=false
		@dxdy=[]
		#        0    1      2      3        4     5      6      7       8     9      10     11      12    13      14    15
		#                                                                             BRIGHT
		# @ccc=%W(black blue      red      magenta green    cyan     yellow   white   black   blue    red     magenta green   cyan    yellow  white  )
		@color_name=%W(#000000 #0000AD  #AD0000  #AD00AD  #00AD00  #00ADAD  #ADAD00  #ADADAD #000000 #0000FF #FF0000 #FF00FF #00FF00 #00FFFF #FFFF00 #FFFFFF)

		@animated_object_name={
			 2 => "FireDown",
			 3 => "GunMachine",
			 4 => "AttrFlash",
			 5 => "Mines",
			 6 => "Teleport",
			 7 => "BoxWhite",
			 8 => "BoxYellow",
			 9 => "SphereHome",
			10 => "PUMP",
			11 => "RocketLauncher",
			12 => "SuperShield",
			13 => "GreenSphereWithLines",
			14 => "BonusPoint",
			15 => "HighVoltage",
			16 => "Exit?",
			17 => "Beam",
		}

		# ap @ccc.size
		# exit
	end

	def putMark(x,y,double_flag=false)
		color="red"
		color="#0000FF" if double_flag
		# @gc.fill_opacity(0.2)
		@gc.stroke(color)
		@gc.stroke_width(0.5)
		# @gc.stroke_opacity(0.6)
		# @gc.opacity(0.9)
		xx=5+(x&0X1F)*8
		# xx=5+@x*8
		yy=5+y*8

		# @gc.rectangle(xx,yy, xx+7,yy+7)
		if double_flag
		 	@gc.line(xx-2,yy-2, xx+9,yy+9)
		 	@gc.line(xx+9,yy-2, xx-2,yy+9)
			# @gc.rectangle(xx+1,yy+1, xx+6,yy+6)
		else
			@gc.line(xx+2,yy+2, xx+5,yy+2)
			@gc.line(xx+5,yy+2, xx+5,yy+5)
			@gc.line(xx+5,yy+5, xx+2,yy+5)
			@gc.line(xx+2,yy+5, xx+2,yy+2)
		end
	end

	def dxdy(oldx,oldy,mode)
		@dxdy << [@x,@y,oldx,oldy,mode]
		# color="YELLOW"
		# @gc.stroke(color)
		# @gc.stroke_width(1)
		# @gc.fill_opacity(1)
		# xx=5+(@x&0X1F)*8
		# yy=5+@y*8
		# xx1=5+(oldx&0X1F)*8
		# yy1=5+oldy*8
		# @gc.line(xx,yy+2, xx1,yy1+2)
	end

	def show_dxdy()
		@gc.stroke_width(0.5)
		@gc.fill_opacity(0.4)

		@dxdy.each do |zz|
			x,y,oldx,oldy,mode=zz
			color="YELLOW"
			color="PINK" if mode == :dx
			color="BLUE" if mode == :setXY

			@gc.stroke(color)

			# xx=5+(x&0X1F)*8
			xx=5+x*8
			yy=5+y*8
			# xx1=5+(oldx&0X1F)*8
			xx1=5+oldx*8
			yy1=5+oldy*8
			@gc.line(xx+4,yy+4, xx1+4,yy1+4)
			@gc.line(xx+4,yy+4, xx1+4,yy1+2)
			# @gc.line(xx-2,yy+2, xx1+4,yy1+4)
		end
	end


	def putchar(char)

		#p ["%02x" % char,char.chr,@font,@color] if @debug

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

		ink   =  (@color&0b00000111)
		paper =  (@color&0b00111000) >> 3
		bright= ((@color&0b01000000) >> 6) != 0
		flash = ((@color&0b10000000) >> 7) != 0


		ink  +=8 if bright
		paper+=8 if bright

		# @gc.rectangle(xx,yy, xx+7,yy+7)

		# @gc.fill(@ccc[@color & 0x7])#'black')

		char_bitmap.each do |b|
			mask=0x80
			0.upto(7) do |x|

				c=if (b & mask) >0 then @color_name[ink] else @color_name[paper] end
				@gc.fill(c)

				@gc.point(xx+x,yy)

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

		if @no_walk > 1
			b=@no_walk
			putMark(@x,@y,true)
			name=@animated_object_name[b]
			# p [:EB,"no_walk_animation",@x,@y,b,name] 
		end

    end


	def xMSG(addr,walk_map=nil)

		if @debug
			# p [:xmsg,addr,walk_map]
		end

		layers=[
		Array.new(32) { Array.new(24) { 0xff } },
		Array.new(32) { Array.new(24) { 0 } },
		]

		# ap overlay
		layers=walk_map unless walk_map.nil?
		# p layers

		exitFlag=false

		x0=@x
		y0=@y

		while !exitFlag

			chr=@ram.get_byte(addr)

			# p ["NEXT BYTE @%04x" % addr,"%02x" % chr, chr,chr.chr,@x,@y] if @debug

			addr+=1

			case chr
				#chr
				when 0x00..0x60

					if @x<32 && @y<24
						putchar chr
						# p [:xy,@x,@y]
						layers[0][@x][@y]=@no_walk
						layers[1][@x][@y]=@overlay
						# a_overlay[@x][@y]=@no_walk
					end

					@x+=1
					@x&=0xff;@y&=0xff


				#deltaY,dbX
				when 0x60..0x90  #0x61..0x90 (-23..23)
					oldx,oldy=@x,@y
					# 0..0x90
					# 0..24
					dy=chr-0x78
					dx=@ram.get_byte(addr);addr+=1
					dx=dx-256 if dx>128
					@y+=dy
					@x+=dx
					@x&=0xff;@y&=0xff
					p [:DXY,"%02x" % chr,:dy,dy,:dx,dx,:oldxy,[oldx,oldy],:xy,[@y,@x]] if @debug

					dxdy(oldx,oldy,:dxy)
				#deltaX,nextY
				when 0x90..0x0CF-1 # 0x91..0xcf (-30..32)
					oldx,oldy=@x,@y
					@y+=1
					dx=chr-0xAF
					@x+=dx
					@x&=0xff;@y&=0xff
					# 0xA4-0xAF=0xF5 -11
					# 0xAA-0xAF=0xFB - 5
					# 0xAB-0xAF=0xFC - 4
					# 0XAD-0xAF-0xFE - 2
					p [:DX_,"%02x" % chr,:dy,'',:dx,dx,:oldxy,[oldx,oldy],:xy,[@y,@x]]if @debug

					dxdy(oldx,oldy,:dx)
				#deltaColor?
				when 0xD0..0xdf-1 #0xd0..0xde
					b=chr-0xcf #0..15
					b=(b-8)|0x40 if b>8

					was=@color
					@color&=0x38
					@color|=b

					p [:COL,"%02x" % chr,
						"was:%02x" % was,
						"new:%02x" % @color,
						"b:(%02x/%02x)" % [b,(chr-0xcf)]
						] if @debug

				#setXY
				when 0xdf
					#NOT USED IN EXOLON
					oldx,oldy=@x,@y
					@y=@ram.get_byte(addr);addr+=1
					@x=@ram.get_byte(addr);addr+=1
					dxdy(oldx,oldy,:setXY)
					@x&=0xff;@y&=0xff
					p [:DF,"setXY",@x,@y] if @debug
				when 0xe0
					#used in block 43
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
					xMSG(zaddr,layers)
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
					#used to fill BIRTHPOD
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
					#if @debug
					if @no_walk>1
						p [:NWK,@x,@y,@no_walk,@animated_object_name[@no_walk]] if @debug
						# putMark(@x,@y,true)
					else
						p [:NWK,@x,@y,@no_walk,"NO_WALK"] if @debug
					end
				#set PRE_Value=0
				when 0xE9
					@overlay=0
					p [:E9,"overlay=0",@overlay] if @debug
				#set PRE_Value=0xFF
				when 0xEA
					@overlay=0xff
					p [:E9,"overlay=0xff",@overlay] if @debug
				#AnimatedObject
				when 0xEB
					b=@ram.get_byte(addr);addr+=1
					putMark(@x,@y,true)
					name=@animated_object_name[b]
					p [:EB,"AnimatedObject",@x,@y,b,name] if @debug

					#9,10,15,16

					# raise "0xEB"
					# zzz=*(HL++)
				else
					p [:EXIT] if @debug
					exitFlag=true
			end
			putMark(x0,y0)
		end
		show_dxdy if @debug_dxdy
	end
end

class Trajectory
	def initialize(ram,gc,addr)
		@ram=ram
		@gc=gc
		@addr=addr
		@h_enemy=read_level_enemy_tab(ram,addr)
		@x0,@y0=120*2,125
	end

	def show(zone)
		info=@h_enemy[zone]
		if info
			show_trajectory(@gc,@ram,info.addr)
			sprites=SPRITES.new(@ram,@gc,0xF8E0,16,16)
			sprites.sprite(info.sprite,255-16,3*8+1)
		end
	end

	private

	def show_trajectory(gc,ram,addr)
		@gc.fill_opacity(1)
		@gc.stroke('white')
		@gc.stroke_width(1)
		@gc.fill('white')

		data=ram.get_bytes(addr,256).each_slice(2).to_a.map{|v| fix_coord(v)}

		x,y=@x0,@y0

		len_c4=0

		@gc.stroke('white')

		data.each do |dd|
			dx,dy=dd
			# p [dx,dy,x,y]
			case dx
			when 0xc3
				# puts "-"
				# @gc.fill('red')
				# @gc.point(@x0,@y0)
				return
			when 0xc4
				# p [:c4,dy]
				len_c4=dy
			else
				# dx,dy=dd
				# p [:dx,dx,dy,len_c4]

				if len_c4>0
					# @gc.fill('green')
					0.upto(len_c4) do
						x+=dx
						y+=dy
						@gc.point(x,y)
					end
					len_c4=0
				else
					# @gc.fill('white')
					x+=dx
					y+=dy
					@gc.point(x,y)
				end
			end
		end
	end

	def fix_coord(d)
		# ap [:fix,d]
		dx,dy=d

		nx,ny=d

		if (dx != 0xc3) && (dx != 0xc4)
			nx=dx&0x7f
			ny=dy&0x7f

			nx=nx-128 if (dx & 0x80)>0
			ny=ny-128 if (dy & 0x80)>0
		else
			# print "."
		end
		# ap [:fix2,nx,ny]
		[nx,ny]
	end

	class LevelEnemy
		attr_reader :zone,:addr,:sprite,:delay

		def initialize(str)
			v=str.pack("C5").unpack("CSCC")
			@zone,@addr,@sprite,@delay=v
		end
		# def to_s
		# 	"zone=#{@zone}, addr=#{"%04X" % @addr}, sprite=#{@sprite}, delay=#{@delay}"
		# end
	end

	def read_level_enemy_tab(ram,addr)
		h_zone={}
		0.upto(69) do |idx|
			e=LevelEnemy.new(ram.get_n_idx(addr,5,idx))
			h_zone[e.zone]=e
		end
		h_zone
	end
end

class SPRITES
	attr_accessor :x,:y,:color

	def initialize(ram,gc,addr,xsize,ysize)

		@debug=true
		@debug=false

		@ram=ram
		@gc=gc
		@addr=addr
		@xsize=xsize
		@ysize=ysize

		# #        0    1      2      3        4     5      6      7       8     9      10     11      12    13      14    15
		# @ccc=%W(black white  red  magenta  green  cyan  yellow  maroon  navy  olive  orange  purple  lime  silver  teal  white  yellow)
	end

	def sprite(idx,x0,y0)

		@gc.fill_opacity(1)
		@gc.stroke('black')
		@gc.stroke_width(1)
		@gc.fill('black')

		sprite_size=@xsize/8*@ysize
		# char_bitmap=@bindata[@font+0+char*8..@font+7+char*8]
		bitmap=@ram.get_bytes(@addr+idx*(sprite_size),sprite_size)


		# p [idx,bitmap.size]
		# ap [bitmap.each_slice(@xsize/8).to_a]
		yy=y0;
		xx=x0;

		# @gc.fill(@ccc[@color & 0x7])#'black')
		@gc.fill('white')
		bitmap.each_slice(@xsize/8)  do |data|
			# ap [data]
			xshift=0
			# p [data,yy]
			data.each do |b|
				mask=0x80
				0.upto(8) do |x|
					@gc.point(xx+x+xshift,yy) if (b & mask) >0
					mask >>=1
				end
				xshift+=8
			end
			yy+=1
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

def highlight(gc,color,x0,y0,x1,y1)
		x0=5+x0*8
		x1=5+x1*8+7
		y0=5+y0*8
		y1=5+y1*8+8

		gc.stroke(color)
		gc.fill(color)
		gc.fill_opacity(0.3)
		gc.stroke_opacity(0.3)
		gc.stroke_width(0)

		gc.rectangle(x0,y0, x1, y1)

		# gc.stroke_opacity(1)
		# gc.line(x0,y0,x1,y1)
end


def draw_block(ram,gc,x,y,blk_id,walk_map=nil)
	h_blk={
		 5 => [-1,  8, -2,  5],#; gunMachine
		13 => [-3,  5, -2, 10],# ; FigureYellow
		15 => [-2,  7, -1,  9],# ; TowerDishWhite
		16 => [-2,  6, -2,  8],# ; TowerRocketWhite
		# 18 => [-6, 11,  -255,  7],# ; box_white
		18 => [-6, 11,  1,  7],# ; box_white
		21 => [-2,  7, -2,  8],# ; bobs_circle
		31 => [-1,  6, -2,  6],# ; SphereWithLinesGreen
		40 => [-1,  6, -2,  8],# ; Wagonetka
		44 => [-1,  8, -2,  4],# ; gunMachineTop
		46 => [-1,  5, -2,  6],# ; MushroomGreen
	}

	xMsg=XMSG.new(ram,gc)
	xMsg.x=x
	xMsg.y=y
	xMsg.color=0

	block_addr=ram.get_word_idx(0x852E,blk_id)

	# puts "Before:"
	# puts walk_map.map{|r| r.map{|v| "%02X " % v}.join}.join("\n")

	xMsg.xMSG(block_addr,walk_map)

	if $show_destroy_zone && h_blk.has_key?(blk_id)

		mx,dx,my,dy=h_blk[blk_id]

		x0=x+mx+1
		x1=x0+dx-1
		y0=y+my+1
		y1=y0+dy-2

		# x0=5+x0*8
		# x1=5+x1*8
		# y0=5+y0*8
		# y1=5+y1*8

		# gc.rectangle(x0,y0, x1, y1)
		highlight(gc,'blue',x0,y0,x1,y1)
	end
end

def draw_level(ram,gc,idx,walk_map)
	level_table_base=0xC7F4
	block_base=ram.get_word_idx(level_table_base,idx)
	trajectory=Trajectory.new(ram,gc,0xA677)
	sprites=SPRITES.new(ram,gc,0xF8E0,16,16)

	# walk_map=[
	# 	Array.new(32) { Array.new(24) { 0xff } },
	# 	Array.new(32) { Array.new(24) { 0 } },
	# ]

	exit=false
	bidx=0
	while !exit
		y,x,blk_id=ram.get_3_idx(block_base,bidx)
		# p ["%04x" % block_base,bidx,[y,x,blk_id]]
		if y==0xFF
			exit=true
		else
			draw_block(ram,gc,x,y,blk_id,walk_map)
		end
		bidx+=1
	end

	trajectory.show(idx)
end

def gen(type,fin,fout,idx)

	imgl = Magick::ImageList.new
	imgl.new_image(265, 200){ self.background_color = "black" }
	# imgl.new_image(600, 300){ self.background_color = "gray" }
	gc = Magick::Draw.new

	ram=RAM.new(fin)



	walk_map=[
		Array.new(32) { Array.new(24) { 0xff } },
		Array.new(32) { Array.new(24) { 0 } },
	]


	case type
	when :blk
		# draw_block(ram,gc,5,5,idx,walk_map)
		draw_block(ram,gc,2,5,idx,walk_map)
	when :level
		draw_level(ram,gc,idx,walk_map)
	when :xmsg
		# draw_xMsg(ram,gc,x,y,addr)
		draw_xMsg(ram,gc,0,0,idx)
	else
		raise "Unknown type #{type}"
	end

	# puts "After:"
	# puts walk_map[1].map{|r| r.map{|v| "%02X " % v}.join}.join("\n")

	# ap walk_map
	if $show_zones
		0.upto(32-1) do |x|
			0.upto(24-1) do |y|
				# p [walk_map[x][y]]
				highlight(gc,'red',x,y,x,y) if walk_map[0][x][y] == 0 # player walk UNDER cell
				highlight(gc,'green',x,y,x,y) unless walk_map[1][x][y] == 0
			end
		end
	end


	gc.draw(imgl) rescue ArgumentError

	imgl.border!(1,1, "LightCyan2")

	imgl.scale!(3)
	imgl.write(fout)
end

# $show_zones=false
# $show_destroy_zone=false

$show_zones=true
$show_destroy_zone=true

# 0.upto(61) do |idx|
#  		puts "------------ #{idx}"
#  		gen(:blk,"exmenu7991.bin","png/blk/blk_%03d.png" % idx,idx)
# end
# idx=19;gen(:blk,"exmenu7991.bin","png/blk/blk_%03d.png" % idx,idx)
# idx=20;gen(:blk,"exmenu7991.bin","png/blk/blk_%03d.png" % idx,idx)

# 0.upto(124) do |idx|
# # 0.upto(12) do |idx|
#  		puts "------------ #{idx}"
#  		gen(:level,"exmenu7991.bin","png/zone/lvl_%03d.png" % idx,idx)
# end

# [
# 	0x6E17,
# 	0x7095,
# 	0x718D,
# 	0x76A2,
# 	0xA057,
# 	0xA156,
# 	0xAAF2,
# 	0xAA3F,
# 	0xA961,


# ].each do |addr|
# 	puts "------------ #{"%04x" % addr}"
#  	gen(:xmsg,"exmenu7991.bin","png/msg/msg_%04x.png" % addr,addr)
# end

