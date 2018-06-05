"
self new graph writeDefToFileNamed: 'graph.pb'
"
Class {
	#name : #MNIST3LayersNNSigmoid,
	#superclass : #MNIST3LayersNNExamplePlan,
	#category : 'LibTensorFlow-Examples'
}

{ #category : #initialization }
MNIST3LayersNNSigmoid >> initializeInferenceGraph [
	hidden1 := graph
		fromBlock: [:image |
			input := image.
			(image * weights1 + biases1) sigmoid]
		named: 'layer1'.
	hidden2 := graph fromBlock: [(hidden1 * weights2 + biases2) sigmoid] named: 'layer2'.
	prediction := graph
		fromBlock: [
			netInput := hidden2 * weights3 + biases3.
			netInput findMaxOn: 1 asInt32Tensor]
		named: 'layer3'.

]

{ #category : #initialization }
MNIST3LayersNNSigmoid >> initializeLearningGraph [
	| axis0 activationGradient gradient1 gradient2 learningRate biasGradient one batchSize learnBiases1 learnBiases2 learnBiases3 learnWeights1 learnWeights2 learnWeights3 |
	
	learningRate := graph const: 0.1 asTensor.
	batchSize := graph fromBlock: [(input sizeOn: 0) castTo: TF_Tensor typeFloat] named: 'batchSize'.
	axis0 := #(0) asInt32Tensor. 
	graph
		fromBlock: [
			activationGradient := activation useOutput: 1.
			biasGradient := activationGradient meanOn: axis0.
			learnWeights3 := weights3 descent: hidden2 \* activationGradient @/ batchSize rate: learningRate.
			learnBiases3 := biases3 descent: biasGradient rate: learningRate]
		named: 'learning3'.
		
	one := 1.0 asTensor asOperationOn: graph.
	graph fromBlock: [
		gradient2 := (activationGradient *\ weights3) @* hidden2 @* (one - hidden2).
		learnWeights2 := weights2 descent: hidden1 \* gradient2 @/ batchSize  rate: learningRate.
		learnBiases2 := biases2 descent: (gradient2 meanOn: axis0) rate: learningRate] 
			named: 'learning2'.
			
	graph fromBlock: [
		gradient1 := (gradient2 *\ weights2) @* hidden1 @* ( one - hidden1).
		learnWeights1 := weights1 descent: input \* gradient1 @/ batchSize  rate: learningRate.
		learnBiases1 := biases1 descent: (gradient1 meanOn: axis0) rate: learningRate] 
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
