#define UNLOADED_FILE   1
#include <idc.idc>

static main() {
	auto ea;
	auto lvl=0;
	auto a;
	auto b;
	auto count;

	// ea = ScreenEA();
	ea=0xc7f4;
	for(lvl=0;lvl<122;lvl++) {
		a=Word(ea);
		b=Word(ea+2);
		count=(b-a)/3;

		MakeUnkn(a,3);
		MakeName	(a,	sprintf("LVL_%03d",lvl) );
		MakeStruct	(a,	"lvl");
		MakeUnkn(a+3,(count-1)*3);
		MakeArray	(a,count);
		SetArrayFormat(a, AP_INDEX, 0, 2);
		MakeByte	(a+(count*3)+1);
		ea=ea+2;
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