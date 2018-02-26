testing-NeuralNetwork
testSimpleNeuralNetwork
	| inputs weights nn prediction target targetValues |
	inputs := TF_Tensor
		fromFloats:
			{{1}.
			{2 ln}}.
	targetValues := #(0.5 0.5).
	target := TF_Tensor fromFloats: targetValues.
	weights := #(#(1 1) #(1 0)).
	nn := SimpleNeuralNetworkExample new.
	nn
		initialWeights: weights;
		learnAll: {inputs} to: {target} steps: 100.
	prediction := nn predict: inputs.
	targetValues with: prediction do: [ :real :predicted | self assert: (real - predicted) abs < 0.1 ]