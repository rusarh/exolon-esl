#define UNLOADED_FILE   1
#include <idc.idc>

static main() {
	auto ea;
	auto run=1;
	auto b;

	ea = ScreenEA();
	// while ( GetFlags(ea) != 0 ) {	// While ea points to valid address
	//   ea = Describe(ea,i);
	//   if ( ea == 0 ) break;
	//   i = i + 1;
	// }


	while (Byte(ea) != 0xff) {
		b=Byte(ea);

		MakeUnkn(ea,1);
		MakeByte(ea);

		if (b<=0x60) 			{ /* noop */ }
		else {	OpEnumEx(ea,	0,	GetEnum("xMsgConsts"),0);}

		if (b>=0x61 && b<=0x90) {
			ea=ea+1;
			MakeByte(ea);
		}
		if (b>=0x91 && b<=0xCE) {
			// ea=ea+1;
			// MakeByte(ea);
		}
		if (b>=0xD0 && b<=0xDE) {
			// ea=ea+1;
			// MakeByte(ea);
		}
		if (b == 0xDF) {
			ea=ea+1;
			MakeStruct	(ea,	"_XY_");
			ea=ea+2-1;
		}
		if (b == 0xE0) {
			ea=ea+1;
			MakeByte(ea);
		}
		if (b == 0xE1) {
			ea=ea+1;
			MakeByte(ea);
		}
		if (b == 0xE2) {
			// ea=ea+1;
			// MakeByte(ea);
		}
		if (b == 0xE3) {
			ea=ea+1;
			MakeWord(ea);
			OpOff(ea,	  0,	0);
			OpOff(ea,	128,	0);
			ea=ea+2-1;
		}
		if (b == 0xE4) {
			ea=ea+1;
			MakeByte(ea);
			ea=ea+1;
			MakeByte(ea);
		}
		if (b == 0xE5) {
			ea=ea+1;
			MakeByte(ea);
			ea=ea+1;
			MakeByte(ea);
		}
		if (b == 0xE6) {
			ea=ea+1;
			MakeWord(ea);
			OpOff(ea,	  0,	0);
			OpOff(ea,	128,	0);
			ea=ea+2-1;
		}
		if (b == 0xE7) { /*  */ }
		if (b == 0xE8) {
			ea=ea+1;
			MakeByte(ea);
		}
		if (b == 0xE9) { /*  */ }
		if (b == 0xEA) { /*  */ }
		if (b == 0xEB) {
			ea=ea+1;
			MakeByte(ea);
		}

		// MakeByte(ea);
		// Message("%x\n", ad);

		ea=ea+1;
	}

	if (Byte(ea) == 0xff) {
		MakeUnkn(ea,1);
		MakeByte(ea);
		OpEnumEx(ea,	0,	GetEnum("xMsgConsts"),0);
		ExtLinA		(ea+1,	0,	";");
	}
}

/*

static decrypt(from, size, key ) {
  auto i, x;           // we define the variables
  for ( i=0; i < size; i=i+1 ) {
    x = Byte(from);    // fetch the byte
    x = (x^key);       // decrypt it
    PatchByte(from,x); // put it back
    from = from + 1;   // next byte
  }
}

	MakeByte	(x=0X7782);
	OpEnumEx		(x,	0,	GetEnum("xMsgConsts"),0);

*/