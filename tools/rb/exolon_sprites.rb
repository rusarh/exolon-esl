#! /usr/local/bin/ruby
require 'fileutils'
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

def draw_sprites(ram,gc,addr,count,xsize,ysize,in_row)
	# ap ["%04x" % addr,count,xsize,ysize]

	sprites=SPRITES.new(ram,gc,addr,xsize,ysize)

	x0=5
	y0=5

	xx=x0
	yy=y0

	dx=xsize+3
	dy=ysize+3

	rowcnt=0;

	0.upto(count) do |idx|
		sprites.sprite(idx,xx,yy);

		rowcnt+=1
		if rowcnt == in_row
			xx=x0
			yy+=dy
			rowcnt=0
		else
			xx+=dx
		end
	end
end

def gen(fin,fout,addr,count,xsize,ysize,in_row)

	imgl = Magick::ImageList.new


	y_row=(count / in_row)+1
	dx=xsize+3
	dy=ysize+3

	x_size=5+dx*in_row+5
	y_size=5+(dy*y_row)

	imgl.new_image(x_size, y_size){ self.background_color = "black" }
	# imgl.new_image(600, 300){ self.background_color = "gray" }
	gc = Magick::Draw.new

	ram=RAM.new(fin)

	draw_sprites(ram,gc,addr,count,xsize,ysize,in_row)

	gc.draw(imgl) rescue ArgumentError

	imgl.border!(1,1, "LightCyan2")

	imgl.write(fout)
end


path="png/sprites"
FileUtils.mkdir_p(path)

# addr,cnt=0xD7E0,0x20+59-1

font_list=[
	[0xF8E0,48,"SPRITES",16,16,10],
	[0xED40,9*4,"SHIFTED",16,8,1],
	[0xEF80,12+12+1,"WALK",24,32,12],
	# [0x,,""],
	# [0x,,""],
]


font_list.each do |data|
	addr,count,name,xsize,ysize,in_row=data

	next if count.nil?

	ofile="#{path}/sprites_#{"%02d" % xsize}x#{"%02d" % ysize}_#{"%04X" % addr}_#{name}.png"
	p ofile
	gen("exmenu7991.bin",ofile,addr,count-1,xsize,ysize,in_row)
end

