testing
testExternalFromArrayOperation
	| op1 op2 array |
	op1 := TF_Operation fromHandle: ExternalAddress new + 11111.
	op2 := TF_Operation fromHandle: ExternalAddress new + 22222.
	array := TF_OperationPtrArrayOld
		externalFromArray: (Array with: op1 with: op2).
	self assert: array first getHandle equals: op1 getHandle.
	self assert: (array at: 2) getHandle equals: op2 getHandle