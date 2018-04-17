binary operations
testGraphVariableFromTruncatedNormalStddev
	| graph session result1 result2 var random values1 values2 init sigma std twoSigma |	
	graph := TF_Graph create.
	
	sigma := 3.14.
	twoSigma := 2 * sigma.
	random := graph truncatedNormalRandomShaped: #(100 100 10) stddev: sigma.
	var := graph variable: 'var' initialValueFrom: random.
	
	session := TF_Session on: graph.
	init := graph operationNamed: 'var_initializer'.
	result1 := session runOutput: (init output: 0).
	result2 := session runOutput: (var output: 0).

	self assert: result1 shape equals: #(100 100 10).
	
	values1 := result1 allFloats.
	std := self standardDeviation: values1.
	self assert: values1 size equals: 100*100*10.	
	self assert: twoSigma - (values1 min abs)  < 0.1.
	self assert: twoSigma - values1 max < 0.1.
	self assert: (self mean:values1 ) abs < (0.01 * std).	
	
	self assert: result1 shape equals: result2 shape.
	values2 := result2 allFloats.
	self assert: values1 equals: values2