require 'ap'
fname="exolon_ingame.sna"
fname="exolon_patched.sna"
fname="exmenu7991.sna"
body=File.open(fname,"rb").read
z=body[0..26].unpack("CSSSSSSSSSCCSSCC")
mem2=body[27..-1].unpack("C*")
	# ;    0        1      byte   I
	# ;    1        8      word   HL',DE',BC',AF'
	# ;    9        10     word   HL,DE,BC,IY,IX
	# ;    19       1      byte   Interrupt (bit 2 contains IFF2, 1=EI/0=DI)
	# ;    20       1      byte   R
	# ;    21       4      words  AF,SP
	# ;    25       1      byte   IntMode (0=IM0/1=IM1/2=IM2)
	# ;    26       1      byte   BorderColor (0..7, not used by Spectrum 1.7)
	# ;    27       49152  bytes  RAM dump 16384..65535

i,hl1,de1,bc1,af1,hl,de,bc,iy,ix,iff,r,af,sp,intmode,border,memm=z
# ap [i,hl1,de1,bc1,af1,hl,de,bc,iy,ix,iff,r,af,sp,intmode,border]
mem=(0..16383).to_a+mem2
-4.upto(4) do |z|
	addr=sp+z
	p ["%02d %04x:%02x" % [z,addr,mem[addr]] ]
end
m=(mem[sp+1]<<8)+mem[sp+0]
ap ["SP: %04x" % sp]
ap ["PC: %04x" % m]

# ap [fname,z]