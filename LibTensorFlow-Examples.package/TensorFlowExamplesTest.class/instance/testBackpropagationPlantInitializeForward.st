testing-Backpropagation
testBackpropagationPlantInitializeForward
	| bpp |
	bpp := BackpropagationPlan new.
	bpp instVarNamed: 'graph' put: TF_Graph create.
	bpp initializeVariables.
	bpp initializeForwardGraph.
	
	self assert: true description: 'No exception should be raised by this test'