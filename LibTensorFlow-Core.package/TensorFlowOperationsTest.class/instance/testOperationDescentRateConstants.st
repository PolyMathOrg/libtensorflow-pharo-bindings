other operations
testOperationDescentRateConstants
	| graph var output pi result session rate |
	graph := TF_Graph create.
	var := graph variable: 'var' initialValue: 1.0 asTensor.
	pi := Float pi asTensor.
	rate := 0.7 asTensor.
	output := var descent: pi rate: rate.
	
	session := TF_Session on: graph.
	graph initializeOn: session.
	result := session runOutput: (output output: 0).
	
	self assert: (1-(Float pi * 0.7) closeTo: result allFloats first)