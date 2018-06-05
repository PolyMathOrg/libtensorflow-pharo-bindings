Class {
	#name : #MNIST3LayersNNExamplePlan,
	#superclass : #Object,
	#instVars : [
		'session',
		'graph',
		'weights1',
		'biases1',
		'weights2',
		'biases2',
		'weights3',
		'biases3',
		'prediction',
		'input',
		'expectedLabel',
		'loss',
		'netInput',
		'activation',
		'hidden2',
		'hidden1',
		'learn'
	],
	#category : 'LibTensorFlow-Examples'
}

{ #category : #accessing }
MNIST3LayersNNExamplePlan >> graph [
	^ graph
]

{ #category : #accessing }
MNIST3LayersNNExamplePlan >> hidden1Size [
	^ 128
]

{ #category : #accessing }
MNIST3LayersNNExamplePlan >> hidden2Size [
	^ 32
]

{ #category : #initialization }
MNIST3LayersNNExamplePlan >> initialize [
	self
		initializeGraph;
		initializeParameters;
		initializeInferenceGraph;
		initializeLossGraph;
		initializeLearningGraph;
		initializeSession.
]

{ #category : #initialization }
MNIST3LayersNNExamplePlan >> initializeGraph [
	graph := TF_Graph create
]

{ #category : #initialization }
MNIST3LayersNNExamplePlan >> initializeInferenceGraph [
	hidden1 := graph
		fromBlock: [:image |
			input := image.
			(image * weights1 + biases1) rectified]
		named: 'layer1'.
	hidden2 := graph fromBlock: [(hidden1 * weights2 + biases2) rectified] named: 'layer2'.
	prediction := graph
		fromBlock: [
			netInput := hidden2 * weights3 + biases3.
			netInput softmax findMaxOn: 1 asInt32Tensor]
		named: 'layer3'.

]

{ #category : #initialization }
MNIST3LayersNNExamplePlan >> initializeLearningGraph [
	|  axis0 backprop learningRate batchSize learnBiases1 learnBiases2 learnBiases3 learnWeights1 learnWeights2 learnWeights3 |
	
	learningRate := graph const: 0.1 asTensor.
	batchSize := graph fromBlock: [(input sizeOn: 0) castTo: TF_Tensor typeFloat] named: 'batchSize'.
	axis0 := graph const: #(0) asInt32Tensor. 
	graph
		fromBlock: [
			| biasGradient activationGradient | 
			activationGradient := activation useOutput: 1.
			biasGradient := activationGradient meanOn: axis0.
			learnWeights3 := weights3 descent: hidden2 \* activationGradient @/ batchSize rate: learningRate.
			learnBiases3 := biases3 descent: biasGradient rate: learningRate.
			backprop := activationGradient *\ weights3]
		named: 'learning3'.
		
	graph fromBlock: [
		| gradient |
		gradient := backprop timesRectifiedGradOf: hidden2.
		learnWeights2 := weights2 descent: hidden1 \* gradient @/ batchSize rate: learningRate.
		learnBiases2 := biases2 descent: (gradient meanOn: axis0) rate: learningRate.
		backprop := gradient *\ weights2] 
			named: 'learning2'.
			
	graph fromBlock: [
		| gradient | 
		gradient := backprop timesRectifiedGradOf: hidden1.
		learnWeights1 := weights1 descent: input \* gradient @/ batchSize rate: learningRate.
		learnBiases1 := biases1 descent: (gradient meanOn: axis0) rate: learningRate] 
			named: 'learning1'.
			
	learn := graph newOperation: 'Identity' named: 'learn' described: [:description |
		description
			addInput: loss output;
			addControlInput: learnWeights1 output;
			addControlInput: learnBiases1 output;
			addControlInput: learnWeights2 output;
			addControlInput: learnBiases2 output;
			addControlInput: learnWeights3 output;
			addControlInput: learnBiases3 output].

]

{ #category : #initialization }
MNIST3LayersNNExamplePlan >> initializeLossGraph [
	loss := graph
		fromBlock: [:expected |
			expectedLabel := expected.
			activation := netInput sparseSoftmaxCrossEntropyWithLogits: expected.
			activation meanOn: #(0) asInt32Tensor]
		inputTypes: {TF_Tensor typeInt32}
		named: 'loss'.
]

{ #category : #initialization }
MNIST3LayersNNExamplePlan >> initializeParameters [
	| aux |
		graph
			fromBlock: [
				aux := graph truncatedNormalRandomShaped: {self inputSize. self hidden1Size} stddev: 1.0 / self inputSize sqrt.
				weights1 := graph variable: 'weights1' initialValueFrom: aux.
				aux := graph zerosShaped: {self hidden1Size}.
				biases1 := graph variable: 'biases1' initialValueFrom: aux.

				aux := graph truncatedNormalRandomShaped: {self hidden1Size. self hidden2Size} stddev: 1.0 / self hidden1Size sqrt.
				weights2 := graph variable: 'weights2' initialValueFrom: aux.
				aux := graph zerosShaped: {self hidden2Size}.
				biases2 := graph variable: 'biases2' initialValueFrom: aux.

				aux := graph truncatedNormalRandomShaped: {self hidden2Size. self outputSize} stddev: 1.0 / self hidden2Size sqrt.
				weights3 := graph variable: 'weights3' initialValueFrom: aux.
				aux := graph zerosShaped: {self outputSize}.
				biases3 := graph variable: 'biases3' initialValueFrom: aux]
			named: 'parameters'

]

{ #category : #initialization }
MNIST3LayersNNExamplePlan >> initializeSession [
	session := TF_Session on: graph.
	graph initializeOn: session.
]

{ #category : #accessing }
MNIST3LayersNNExamplePlan >> inputSize [
	^ 28*28
]

{ #category : #accessing }
MNIST3LayersNNExamplePlan >> intput [
	^ input
]

{ #category : #accessing }
MNIST3LayersNNExamplePlan >> lossGradient [
	^ (loss output: 1)
]

{ #category : #accessing }
MNIST3LayersNNExamplePlan >> outputSize [
	^ 10
]

{ #category : #running }
MNIST3LayersNNExamplePlan >> predict: inputs [
	| results |
	results := session
		runInputs: {input input: 0}
		values: {inputs asFloatTensor}
		outputs: {prediction output}.
	^ results first
]

{ #category : #running }
MNIST3LayersNNExamplePlan >> predict: inputs andCompareTo: label [
	| results |
	results := session
		runInputs: {input input: 0. expectedLabel input: 0}
		values: {inputs asFloatTensor. label asInt32Tensor}
		outputs: {prediction output. loss output}.
	^ results
]

{ #category : #running }
MNIST3LayersNNExamplePlan >> predict: inputs andLearnFrom: label [
	| results |
	results := session
		runInputs: {input input: 0. expectedLabel input: 0}
		values: {inputs asFloatTensor. label asInt32Tensor}
		outputs: {loss output. learn output}.
	^ results
]
