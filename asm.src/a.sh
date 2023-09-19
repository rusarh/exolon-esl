#!/bin/sh
zmac -m exmenu7991.asm

if [ $? -ne 0 ];then
   echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
   echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
   echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
else
	mv zout/exmenu7991.cim exmenu7991.sna
	cd us
	wine unreal ../exmenu7991.sna
fi
