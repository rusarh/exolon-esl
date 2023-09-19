
#! /usr/local/bin/ruby
require 'RMagick'
require 'ap'


x=255/8

0.upto(191) do |z|
	y=z/8
	h=(y/8)<<8
	l=(y&0x7)<<5
	a0=h+l
	a1=h+(l+x)
	p [z,y,"%04x" % a0,"%04x" % (y*32)]
end
__END__

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

	# private
	def get_n_idx(addr,size,idx)
		get_bytes(addr+size*idx,size)
	end
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

def show_trajectory(gc,ram,addr)
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
	gc.fill_opacity(1)
	gc.stroke('white')
	gc.stroke_width(1)
	gc.fill('white')

	data=ram.get_bytes(addr,256).each_slice(2).to_a.map{|v| fix_coord(v)}

	x0,y0=255,120
	x,y=x0,y0

	len_c4=0

	gc.stroke('white')

	data.each do |dd|
		dx,dy=dd
		# p [dx,dy,x,y]
		case dx
		when 0xc3
			puts "-"
			gc.fill('red')
			gc.point(x0,y0)
			return
		when 0xc4
			p [:c4,dy]
			len_c4=dy
		else
			# dx,dy=dd
			p [:dx,dx,dy,len_c4]

			if len_c4>0
				gc.fill('green')
				0.upto(len_c4) do
					x+=dx
					y+=dy
					gc.point(x,y)
				end
				len_c4=0
			else
				gc.fill('white')
				x+=dx
				y+=dy
				gc.point(x,y)
			end
		end
	end
end


def gen(type,fin,fout,addr)

	imgl = Magick::ImageList.new
	imgl.new_image(265, 200){ self.background_color = "black" }
	# imgl.new_image(600, 300){ self.background_color = "gray" }
	gc = Magick::Draw.new

	ram=RAM.new(fin)

	show_trajectory(gc,ram,addr)

	gc.draw(imgl) rescue ArgumentError

	imgl.border!(1,1, "LightCyan2")

	imgl.scale!(3)
	imgl.write(fout)
end

ram=RAM.new("exmenu7991.bin")
ap read_level_enemy_tab(ram,0xA677)
__END__
addrs=[
	0xa406,
	0xa445,
	0xa490,
	0xa4c5,
	0xa4ce,
	0xa4e3,
]

addrs.each do |addr|
	p "%04x" % addr
	gen(:level,"exmenu7991.bin","png/enemy_strategy/strategy_%04x.png" % addr,addr)
end
