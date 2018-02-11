graphs
decodeCSVGraphDefaults: anArrayOfTF_Tensors
	| graph records defaults |
	
	graph := TF_Graph create.
	records := (graph placeholder: 'records' type: TF_Tensor typeString) output: 0.
	defaults := Array new: anArrayOfTF_Tensors size.
	
	anArrayOfTF_Tensors withIndexDo: [:each :index |
		| one |
		one := (graph const: 'default',index printString value: each) output: 0.
		defaults at: index put: one].
	graph newOperation: 'DecodeCSV' named: 'output' described: [:description |
		description addInput: records.
		description addInputs: defaults].
	
	^ graph