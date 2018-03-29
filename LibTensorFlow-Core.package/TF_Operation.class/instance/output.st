initialization
output
"The list of Tensor objects representing the outputs of this op."

	output ifNil: [ output := 0 ].
	^ self output: output