printing
printOn: strm
	super printOn: strm.
	self isNull
		ifFalse: [ strm
				space;
				print: self code;
				space;
				print: self message ]