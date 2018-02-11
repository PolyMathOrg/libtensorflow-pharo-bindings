binary operations
testGraphTruncatedNormal
	| graph session result random values std theoreticalDecile expected |	
	graph := TF_Graph create.
	
	random := graph truncatedNormalRandomShaped: #(100 100 10).

	session := TF_Session on: graph.
	result := session runOutput: (random output: 0).
	
	values := result allFloats.
	theoreticalDecile := -1.1840324666939051.
	std := values standardDeviation.
	self assert: result shape equals: #(100 100 10).
	self assert: values size equals: 100*100*10.
	self assert: values min + 2 < 0.01.
	self assert: 2 - values max < 0.01.
	self assert: values mean abs < (0.01*std).
	expected :=  { theoreticalDecile. 
							theoreticalDecile negated}.
							
	#(0.1 0.9) with: expected do:[:p :e| | observed | 
		observed := self percentile: p from: values.
		self assert: (observed - e) abs < 0.2].
	