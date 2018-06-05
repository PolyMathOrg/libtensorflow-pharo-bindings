Class {
	#name : #ExampleNearestNeighborPlan,
	#superclass : #ExamplePlan,
	#category : 'LibTensorFlow-Examples'
}

{ #category : #initialization }
ExampleNearestNeighborPlan >> initializeGraph [
	| neg add abs axis axisValue distance testing training prediction |
	super initializeGraph.
	
	training := graph placeholder: 'training' type: TF_Tensor typeFloat.
	testing := graph placeholder: 'testing' type: TF_Tensor typeFloat.
	axisValue := TF_Tensor fromInt32: 0.
	axis := graph const: 'axis' value: axisValue.
	neg := graph newOperation: 'Neg' named: 'neg' described: [:description |
		description addInput: (testing output: 0)].
	add := graph add: 'add' described:[:description| 
		description addInput: (neg output: 0).
		description addInput: (training output: 0).
		].
	abs := graph newOperation: 'Abs' named: 'abs' described: [:description|
		description addInput: (add output: 0)].
	distance := graph newOperation: 'Sum' named: 'distance' described: [:description|
		description addInput: (abs output: 0).
		description addInput: (axis output: 0).].
	
	prediction := graph newOperation: 'ArgMin' named: 'argmin' described:[:description|
		description addInput: (distance output: 0).
		description addInput: (axis output: 0)].
	
	outputs := {prediction output: 0}.
	inputs := {training input: 0. testing input: 0}.
]

{ #category : #initialization }
ExampleNearestNeighborPlan >> initializeGraphWithOperations [
	| axis distance testing training prediction |
	graph := TF_Graph create.
	
	training := graph placeholder: 'training' type: TF_Tensor typeFloat.
	testing := graph placeholder: 'testing' type: TF_Tensor typeFloat.
	axis := 0 asInt32Tensor.
	
	distance := (testing - training) abs sumOn: axis.
	prediction := distance findMinOn: axis.
	
	outputs := {prediction output: 0}.
	inputs := {training input: 0. testing input: 0}.

]

{ #category : #evaluating }
ExampleNearestNeighborPlan >> predict: covariatesTesting from: covariatesTraining [
	| result |

 	result := self runOn: {covariatesTraining. covariatesTesting}.
	^ result allInt64s + 1
]
