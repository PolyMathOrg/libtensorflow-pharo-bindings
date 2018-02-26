running
runOperation: aTF_Operation input: inTF_OutputOrInput value: inTF_Tensor output: outTF_Output
	| inputs invalues operations outputs outvalues tensor |
	inputs := Array with: inTF_OutputOrInput.
	invalues := Array with: inTF_Tensor.
	outputs := Array with: outTF_Output.
	operations := Array with: aTF_Operation.
	outvalues := self
		runOperations: operations
		inputs: inputs
		values: invalues
		outputs: outputs.
	tensor := outvalues first.
	^ tensor