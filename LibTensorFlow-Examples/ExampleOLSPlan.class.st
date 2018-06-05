Class {
	#name : #ExampleOLSPlan,
	#superclass : #ExamplePlan,
	#category : 'LibTensorFlow-Examples'
}

{ #category : #initialization }
ExampleOLSPlan >> initializeGraph [
	| x xtx y xty inverse result |
	super initializeGraph.
	
	x := graph placeholder: 'x' type: TF_Tensor typeFloat.
	y := graph placeholder: 'y' type: TF_Tensor typeFloat.
	
	xtx := graph newOperation: 'MatMul' named:'xTx' described:[:description|
		description addInput: (x output: 0).
		description addInput: (x output: 0).
		description at: 'transpose_a' putBoolean: true.
		].
	
	inverse := graph newOperation: 'MatrixInverse' named:'inv' described:[:description|
		description addInput: (xtx output: 0)].
	
	xty := graph newOperation: 'MatMul' named:'xTy' described:[:description|
		description addInput: (x output: 0).
		description addInput: (y output: 0).
		description at: 'transpose_a' putBoolean: true.
		].
	
	result := graph newOperation: 'MatMul' named:'result' described:[:description|
		description addInput: (inverse output: 0).
		description addInput: (xty output: 0).
		].
	
	outputs := {result output: 0}.
	inputs := {x input: 0. y input: 0}.
]

{ #category : #initialization }
ExampleOLSPlan >> initializeGraphWithOperations [
	| x y prediction |
	super initializeGraph.
	
	x := graph placeholder: 'x' type: TF_Tensor typeFloat.
	y := graph placeholder: 'y' type: TF_Tensor typeFloat.
	
	prediction := (x \* x) inverse * (x \* y).
	
	outputs := {prediction output: 0}.
	inputs := {x input: 0. y input: 0}.
]
