testing
testOperationArrayAtPut
	| graph sample |
	graph := TF_Graph create.
	sample := graph placeholder: 'var' type: TF_Tensor typeInt64.
	self testArrayAtPutFor: TF_OperationPtrArrayOld elementSample: sample