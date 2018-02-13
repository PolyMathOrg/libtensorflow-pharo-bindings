initialization
initializeParameters
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

			aux := graph truncatedNormalRandomShaped: {self hidden2Size. self hidden3Size } stddev: 1.0 / self hidden2Size sqrt.
			weights3 := graph variable: 'weights3' initialValueFrom: aux.
			aux := graph zerosShaped: {self hidden3Size }.
			biases3 := graph variable: 'biases3' initialValueFrom: aux.
			
			aux := graph truncatedNormalRandomShaped: {self hidden3Size. self outputSize } stddev: 1.0 / self hidden3Size sqrt.
			weights4 := graph variable: 'weights4' initialValueFrom: aux.
			aux := graph zerosShaped: {self outputSize }.
			biases4 := graph variable: 'biases4' initialValueFrom: aux]
		named: 'parameters'
		
		
