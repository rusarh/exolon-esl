#!/bin/sh
rm exmenu7991.sna 2>&1 >/dev/null
rm zout/exmenu7991.* 2>&1 >/dev/null

zmac -m exmenu7991.asm

if [ $? -ne 0 ];then
   echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
   echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
   echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
else
	mv zout/exmenu7991.cim exmenu7991.sna
	rm zout/exmenu7991.* 2>&1 >/dev/null
#	cd us
#	wine unreal ../exmenu7991.sna
	fuse exmenu7991.sna >/dev/null
fi
