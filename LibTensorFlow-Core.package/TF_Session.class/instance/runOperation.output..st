running
runOperation: aTF_Operation output: aTF_Output
	| operations answer outputs |
	operations := TF_OperationPtrArray externalNew: 1.
	outputs := TF_OutputArray externalNew: 1.
	outputs at:1 put: aTF_Output.
	operations at:1 put: aTF_Operation getHandle getHandle.
	answer := self runOperations: operations outputs: outputs size: 1.
	^ answer first