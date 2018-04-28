testing
testExternalFromArrayOutput
	| o1 o2 array |
	o1 := TF_Output new index: 16r40302010.
	o2 := TF_Output new index: 16r76543210.
	array := TF_OutputArrayOld externalFromArray: (Array with:o1 with: o2 ).
	self assert: array first index equals: o1 index.
	self assert: array second index equals: o2 index