running
regress: x on: y
	| result |
	result := plan runOn: {x. y}.
	^ result allFloats