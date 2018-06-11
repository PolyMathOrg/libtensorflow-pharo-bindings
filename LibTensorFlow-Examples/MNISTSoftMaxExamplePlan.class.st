Class {
	#name : #MNISTSoftMaxExamplePlan,
	#superclass : #Object,
	#instVars : [
		'session',
		'graph',
		'weights',
		'biases',
		'prediction',
		'netInput',
		'input',
		'loss',
		'expectedLabel',
		'learnWeights',
		'learnBiases',
		'activation'
	],
	#category : 'LibTensorFlow-Examples'
}

{ #category : #initialization }
MNISTSoftMaxExamplePlan >> initialize [
	self
		initializeGraph;
		initializeParameters;
		initializeInferenceGraph;
		initializeLossGraph;
		initializeLearningGraph;
		initializeSession.
]

{ #category : #initialization }
MNISTSoftMaxExamplePlan >> initializeGraph [
	graph := TF_Graph create
]

{ #category : #initialization }
MNISTSoftMaxExamplePlan >> initializeInferenceGraph [
	prediction := graph
		fromBlock: [ :image | 
			input := image.
			netInput := image * weights + biases.
			netInput softmax findMaxOn: 1 asInt32Tensor ]
		named: 'inference'
]

{ #category : #initialization }
MNISTSoftMaxExamplePlan >> initializeLearningGraph [
	| learningRate activationGradient biasGradient |
	graph
		fromBlock: [ | batchSize |
			learningRate := 0.9 asTensor.
			activationGradient := activation useOutput: 1.
			biasGradient := activationGradient meanOn: #(0) asInt32Tensor.
			batchSize := (input sizeOn: 0) castTo: TF_Tensor typeFloat.
			learnWeights := weights descent: input \* activationGradient @/ batchSize rate: learningRate.
			learnBiases := biases descent: biasGradient rate: learningRate]
		named: 'learning'
]

{ #category : #initialization }
MNISTSoftMaxExamplePlan >> initializeLossGraph [
	loss := graph
		fromBlock: [:expected |
			expectedLabel := expected.
			activation := netInput sparseSoftmaxCrossEntropyWithLogits: expected.
			activation meanOn: #(0) asInt32Tensor]
		inputTypes: {TF_Tensor typeInt32}
		named: 'loss'

]

{ #category : #initialization }
MNISTSoftMaxExamplePlan >> initializeParameters [
	| aux |
	aux := graph zerosShaped: {self inputSize. self outputSize}.
	weights := graph variable: 'weights' initialValueFrom: aux.
	aux := graph zerosShaped: {self outputSize}.
	biases := graph variable: 'biases' initialValueFrom: aux.
]

{ #category : #initialization }
MNISTSoftMaxExamplePlan >> initializeSession [
	session := TF_Session on: graph.
	graph initializeOn: session.
]

{ #category : #accessing }
MNISTSoftMaxExamplePlan >> inputSize [
	^ 28*28
]

{ #category : #accessing }
MNISTSoftMaxExamplePlan >> outputSize [
	^ 10
]

{ #category : #running }
MNISTSoftMaxExamplePlan >> predict: inputs [
	| results |
	results := session
		runInputs: {input input: 0}
		values: {inputs asFloatTensor}
		outputs: {prediction output: 0}.
	^ results first
]

{ #category : #running }
MNISTSoftMaxExamplePlan >> predict: inputs andCompareTo: label [
	| results |
	results := session
		runInputs: {input input: 0. expectedLabel input: 0}
		values: {inputs asFloatTensor. label asInt32Tensor}
		outputs: {prediction output. loss output}.
	^ results
]

{ #category : #running }
MNISTSoftMaxExamplePlan >> predict: inputs andLearnFrom: label [
	| results |
	results := session
		runInputs: {input input: 0. expectedLabel input: 0}
		values: {inputs asFloatTensor. label asInt32Tensor}
		outputs: {loss output. learnWeights output. learnBiases output}.
	^ results
]
