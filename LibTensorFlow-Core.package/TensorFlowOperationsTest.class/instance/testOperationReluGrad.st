unary operations
testOperationReluGrad
	| graph template session result previousGradient rectifiedGrad expected previousGradientTemplate |
	
	template := #(
		(-1.1	1.2)
		(-2.1	2.2)
		(0		-0)) asFloatTensor.
		

	graph := TF_Graph create.
	
	previousGradientTemplate := #(
		(0	1)
		(1	0)
		(1		1)) asFloatTensor.
		
	previousGradient := previousGradientTemplate asOperationOn: graph.
	rectifiedGrad := previousGradient timesRectifiedGradOf: template.
	
	session := TF_Session on: graph.
	result := session runOutput: rectifiedGrad output.
	
	self assert: result shape equals: template shape.
	expected := template allFloats with: previousGradientTemplate allFloats collect:[:x :y| (x sign max: 0) * y].
	self assert: result allFloats equals: expected.
