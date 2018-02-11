initialize-release
fromBlock: aBlockClosure named: nameString
	| types |
	types := Array new: aBlockClosure argumentCount.
	types atAllPut: TF_Tensor typeFloat.
	^ self fromBlock: aBlockClosure inputTypes: types named: nameString