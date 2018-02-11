initialize-release
fromBlock: aBlockClosure
	| types |
	types := Array new: aBlockClosure argumentCount.
	types atAllPut: TF_Tensor typeFloat.
	^ self fromBlock: aBlockClosure inputTypes: types