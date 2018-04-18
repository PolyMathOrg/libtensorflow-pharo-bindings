testing
testExternalFromArrayOutput
	| o1 o2 array |
	o1 := TF_Output new index: 16rFFFF.
	o2 := TF_Output new index: 16rAAAA.
	array := TF_OutputArray externalFromArray: (Array with:o1 with: o2 ).
	self assert: array first index equals: o1 index.
	self assert: array second index equals: o2 index