unary operations
testOperationMatrixInverse
	| graph template session const result identity inverse |
	template := TF_Tensor fromFloats: #(#(-1.1 1.2) #(-2.1 -2.2)).
	graph := TF_Graph create.
	const := graph const: 'const' value: template.
	inverse := const inverse.
	identity := const * inverse output: 0.
	session := TF_Session on: graph.
	result := session runOutput: identity.
	self assert: result shape equals: template shape.
	result allFloats
		with: #(1.0 0.0 0.0 1.0)
		do: [ :real :expected | self assert: (real closeTo: expected) ]