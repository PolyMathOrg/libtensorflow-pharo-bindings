testing-Backpropagation
testBackpropagationPlantInitializeVariables
	| bpp graph const weights |
	bpp := BackpropagationPlan basicNew.
	bpp instVarNamed: 'graph' put: TF_Graph create.
	bpp initializeVariables.
	graph := bpp graph.
	self assert: graph allInitializers size equals: 1.
	self assert: graph allVariables size equals: 1.
	self assert: graph allVariables first name equals: 'weights'.
	const := graph operationNamed: 'weights_initialValue'.
	weights := const tensorAt: 'value'.
	self assert: weights shape equals: #(2 2).
	weights allFloats
		do: [ :each | self assert: (each between: 0 and: 1) ]