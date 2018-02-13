initialization
initializeBackwardGraph
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