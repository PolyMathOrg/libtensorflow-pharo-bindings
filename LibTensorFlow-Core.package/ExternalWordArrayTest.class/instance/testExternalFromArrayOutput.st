testing
testExternalFromArrayOutput
	| o1 o2 array |
	o1 := TF_Output new index: 16r8070605040302010.
	o2 := TF_Output new index: 16rFEDCBA9876543210.
	array := TF_OutputArray externalFromArray: (Array with:o1 with: o2 ).
	self assert: array first index equals: o1 index.
	self assert: array second index equals: o2 index