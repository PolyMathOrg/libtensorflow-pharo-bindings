operation description
finishOperation: aTF_OperationDescription status: aTF_Status
	| answer |
	
	answer := self finishOperationAsVoid: aTF_OperationDescription status: aTF_Status.
	answer handle: answer getHandle getHandle.
	^answer