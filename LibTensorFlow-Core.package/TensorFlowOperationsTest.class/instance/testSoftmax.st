unary operations
testSoftmax
	| graph template session const result output denominator |
	
	template := TF_Tensor fromFloats: {{0. 3  ln}}.
	graph := TF_Graph create.
	
	const := graph const: 'const' value: template.
	output := const softmax output.
	
	session := TF_Session on: graph.
	result := session runOutput: output.

	self assert: result shape equals: template shape.
	
	denominator := template allFloats exp sum. 
	result allFloats with: template allFloats exp / denominator do: [:res :temp |
		| delta |
		delta := (res  - temp) abs.
		self assert: delta < 0.001].
	
	output free.
