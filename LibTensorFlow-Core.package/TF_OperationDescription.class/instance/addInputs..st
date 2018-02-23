inputs
addInputs: anArrayOfTF_Output
	| inputs |
	inputs := TF_OutputArray externalFromArray: anArrayOfTF_Output.
	self library description: self addInputs: inputs size: anArrayOfTF_Output size