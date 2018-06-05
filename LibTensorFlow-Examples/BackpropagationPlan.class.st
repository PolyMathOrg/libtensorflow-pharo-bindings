Class {
	#name : #BackpropagationPlan,
	#superclass : #ExamplePlan,
	#instVars : [
		'weights',
		'activation',
		'target',
		'learn',
		'delta',
		'lastDelta'
	],
	#category : 'LibTensorFlow-Examples'
}

{ #category : #accessing }
BackpropagationPlan >> delta [
	^ lastDelta
]

{ #category : #accessing }
BackpropagationPlan >> graph [
	^ graph
]

{ #category : #initialization }
BackpropagationPlan >> initializeBackwardGraph [
	| actual learningRate learningRateValue one input |
	actual := activation.
	one := graph const: 'one' value: #((1 1) (1 1)) asFloatTensor.
	
	learningRateValue := 0.9 asTensor.
	learningRate := graph const: 'learningRate' value: learningRateValue.

	input := inputs first operationOn: graph.
	
	target := graph placeholder: 'target' type: TF_Tensor typeFloat.
	
	delta := (target - actual) negated @* actual @* (one - actual) @* input.
	
	"learn := weights assign: weights - learningRate @* delta."
	"learn := weights -= learningRate @* delta."
	learn := weights descent: delta rate: learningRate.
]

{ #category : #initialization }
BackpropagationPlan >> initializeForwardGraph [
	| input |
	input := graph placeholder: 'Input' type: TF_Tensor typeFloat.
	
	activation := (weights * input) sigmoid.
	
	outputs := {activation output: 0}.
	inputs := {input input: 0}
]

{ #category : #initialization }
BackpropagationPlan >> initializeGraph [
	super initializeGraph.
	self
		initializeVariables;
		initializeForwardGraph;
		initializeBackwardGraph.
]

{ #category : #initialization }
BackpropagationPlan >> initializeVariables [
	| initialWeights |
	Random withDefaultDo: [:random |
		initialWeights := (1 to: 4) collect: [:unused | random next]].
	initialWeights := TF_Tensor fromFloats: initialWeights shape: #(2 2).
	
	weights := graph variable: 'weights' initialValue: initialWeights.
]

{ #category : #training }
BackpropagationPlan >> learn: sample with: expected [
	| results |	
	results := session
		runInputs: {inputs first. target input: 0}
		values: {sample. expected}
		outputs: {learn output: 0. delta output: 0}.
	
	lastDelta := results at: 2.
	^ results first
	
]

{ #category : #accessing }
BackpropagationPlan >> weights [
	^ session runOutput: (weights output: 0)
]
