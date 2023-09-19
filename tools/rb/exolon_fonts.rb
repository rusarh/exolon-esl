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

class FONT
	attr_accessor :x,:y,:color

	def initialize(ram,gc,font)

		@debug=true
		@debug=false

		@ram=ram
		@gc=gc
		@font=font

		#        0    1      2      3        4     5      6      7       8     9      10     11      12    13      14    15
		@ccc=%W(black white  red  magenta  green  cyan  yellow  maroon  navy  olive  orange  purple  lime  silver  teal  white  yellow)

		# ap @ccc.size
		# exit
	end

	def putchar(char,x0,y0)


		@gc.fill_opacity(1)
		@gc.stroke('black')
		@gc.stroke_width(1)
		@gc.fill('black')

		# char_bitmap=@bindata[@font+0+char*8..@font+7+char*8]
		char_bitmap=@ram.get_bytes(@font+char*8,8)

		# p [:putchar,char,x0,y0,char_bitmap.size]


		# xx=5+(x&0X1F)*8
		# yy=5+y*8

		# @gc.rectangle(xx,yy, xx+7,yy+7)

		yy=y0;
		xx=x0;

		# @gc.fill(@ccc[@color & 0x7])#'black')
		@gc.fill('white')
		char_bitmap.each do |b|
			mask=0x80
			0.upto(7) do |x|
				@gc.point(xx+x,yy) if (b & mask) >0
				mask >>=1
			end
			yy+=1
		end
    end
end

def draw_font(ram,gc,addr,count)
	# ap ["%04x" % addr,count]

	font=FONT.new(ram,gc,addr)

	x0=5
	y0=5

	xx=x0
	yy=y0

	dx=8+3
	dy=8+3

	rowcnt=0;

	0.upto(count) do |idx|
		font.putchar(idx,xx,yy);

		rowcnt+=1
		if rowcnt == 0x10
			xx=x0
			yy+=dy
			rowcnt=0
		else
			xx+=dx
		end

	end

end

def gen(fin,fout,addr,count)

	imgl = Magick::ImageList.new


	y_row=(count / 16)+1
	dx=8+3
	dy=8+3

	x_size=5+dx*16+5
	y_size=5+(dy*y_row)

	imgl.new_image(x_size, y_size){ self.background_color = "black" }
	# imgl.new_image(600, 300){ self.background_color = "gray" }
	gc = Magick::Draw.new

	ram=RAM.new(fin)

	# draw_level(ram,gc,idx)
	# draw_block(ram,gc,5,5,idx)
	draw_font(ram,gc,addr,count)

	gc.draw(imgl) rescue ArgumentError

	imgl.border!(1,1, "LightCyan2")

	imgl.write(fout)
end


path="png/font"
FileUtils.mkdir_p(path)

# addr,cnt=0xD7E0,0x20+59-1

font_list=[
	[0xD7E0,0x20+59,"FONT_ALPHA1"],
	[0xDAB8,38,"FONT_ZONE_0"],
	[0xDBE8,42,"FNT_Ship"],
	[0xDD38,20,"FONT_Planet"],
	[0xDDD8,32,"FONT_GunMachine"],
	[0xDED8,20,"FNT_RedGround"],
	[0xDF78,20,"FNT_Gate"],
	[0xE018,31,"FNT_FigYellow"],
	[0xE110,42,"FNT_WhiteDish"],
	[0xE260,12,"FNT_Gate2"],
	[0xE2C0, 4,"FNT_BOX"],
	[0xE2E0,20,"FNT_CIRCLE"],
	[0xE380,25,"FONT_GreenGround"],
	[0xE448,18,"FONT_Planet2"],
	[0xE4D8,37,"FNT_YellowTopDown"],
	[0xE600,22,"FNT_SphreWithHead"],
	[0xE6B0,50,"FNT_EXOLON"],
	[0xE840, 4,"FNT_SmallHLIne"],
	[0xE860,28,"FONT_GroundRed"],
	[0xE940,29,"FONT_EndLevel"],
	[0xEA28,17,"FONT_GunMachineBottom"],
	[0xEAB0, 8,"FONT_BraveryBonus"],
	[0xEAF0,31,"FNT_MushRoom"],
	[0xEBE8,12,"FNT_DOWNSPH"],
	[0xEC48,19,"FNT_YellowHLine"],
	[0xECE0,12,"FNT_BORDER_BONUS"],

	[0xED40,nil,nil],
	# [0x,,""],
	# [0x,,""],
]

#size checker
0.upto(font_list.size-1) do |idx|
	addr,count,name=font_list[idx]
	next if count.nil?
	naddr,ncount,nname=font_list[idx+1]

	size=(naddr-addr)/8
	p ["%04x" % addr,count,size] unless size==count
end

font_list.each do |data|
	addr,count,name=data

	next if count.nil?

	ofile="#{path}/fnt_#{"%04X" % addr}_#{name}.png"
	p ofile
	gen("exmenu7991.bin",ofile,addr,count-1)
end

# [
# 0x5003,0x5014,0x5025,
# 0x6d1a,0x6E23,
# 0x7066,0x6C78,0x7782,
# 0x7809,0x7890,
# 0x45d4
# ].each do |addr|
#  	gen("ex_game.bin","png/msg/msg_%04x.png" % addr,addr)
# end

