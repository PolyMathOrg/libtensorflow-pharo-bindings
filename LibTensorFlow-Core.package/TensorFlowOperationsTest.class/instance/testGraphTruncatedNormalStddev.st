binary operations
testGraphTruncatedNormalStddev
	| graph session result random values sigma twoSigma std theoreticalDecile expected |	
	graph := TF_Graph create.
	
	sigma := 3.14.
	twoSigma := 2 * sigma.
	random := graph truncatedNormalRandomShaped: #(100 100 10) stddev: sigma.

	session := TF_Session on: graph.
	result := session runOutput: (random output: 0).
	values := result allFloats.
	
	std := values standardDeviation.
	theoreticalDecile := -1.1840324666939051.
		
	self assert: result shape equals: #(100 100 10).
	self assert: values size equals: 100*100*10.
	self assert: twoSigma - (values min abs)  < 0.1.
	self assert: twoSigma - values max < 0.1.
	self assert: values mean abs < (0.01 * std).
	expected :=  { theoreticalDecile * sigma. 
							theoreticalDecile negated * sigma.
							-2.
							2}.
							
	#(0.1 0.9 0.25 0.75) with: expected do:[:p :e| | observed | 
		observed := self percentile: p from: values.
		self assert: (observed - e) abs < 0.2].
	