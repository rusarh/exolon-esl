require 'fileutils'
require 'ap'

#compare "LEVEL (LVL_XXX)" with original file
#checkt that after "naming" block element all ok

def z(file)
	bindata=File.open(file,"rb").read.unpack("C*")
	if bindata.size<0x10000
		ss=0x10000-bindata.size
		b=[0]*ss
		bindata=b+bindata
	end
	bindata
end


def compare(d1,d2)
	diff_count=0

	s1=d1[2][d1[0]..d1[1]]
	s2=d2[2][d2[0]..d2[1]]

	raise "area sizes ara diffrent !!!" unless s1.size == s2.size

	unless s1==s2
	 	0.upto(s1.size-1) do |offset|
	 		b1,b2=s1[offset],s2[offset]
	 		diff_count+=1 unless b1==b2
	 		p ["%04x" % (d1[0]+offset),"%04x" % (d2[0]+offset),"%02x:%02x" % [b1,b2],b1==b2 ? "" : "!!!!!!" ]
	 	end
	end
	diff_count == 0 ? "OK" : "#{diff_count} DIFFERENCES "
end



src=[0xC8EE,0xD8DF,z("../bin/exmenu7991.bin")]

#values should fetched from lst file ....
#   LVL_000 LVL_124-last byte (0xff)
sna=[0xC89C,0xD88D,z("../../asm/exmenu7991.sna")]

puts compare(src,sna)

