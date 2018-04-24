operation description
finishOperation: aTF_OperationDescription status: aTF_Status
	| answer |
	
	answer := self finishOperationAsVoid: aTF_OperationDescription status: aTF_Status.
	^ TF_Operation fromHandle: answer getHandle.