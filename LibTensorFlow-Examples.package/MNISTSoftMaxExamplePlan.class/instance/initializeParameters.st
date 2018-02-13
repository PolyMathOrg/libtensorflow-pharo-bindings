initialization
initializeParameters
	| aux |
	aux := graph zerosShaped: {self inputSize. self outputSize}.
	weights := graph variable: 'weights' initialValueFrom: aux.
	aux := graph zerosShaped: {self outputSize}.
	biases := graph variable: 'biases' initialValueFrom: aux.