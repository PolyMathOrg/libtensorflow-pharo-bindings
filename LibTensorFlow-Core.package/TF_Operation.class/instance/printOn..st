printing
printOn: stream
	super printOn: stream.
	"handle isNull
		ifFalse: [ stream
				space;
				print: self type;
				space;
				print: self name ]"