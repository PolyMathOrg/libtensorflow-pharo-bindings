initialization
initializeLearningGraph
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
