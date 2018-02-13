testing-Backpropagation
testBackpropagationPlantInitializeBackguard
	| bpp |
	bpp := BackpropagationPlan basicNew.
	bpp instVarNamed: 'graph' put: TF_Graph create.
	bpp initializeVariables.
	bpp initializeForwardGraph.
	bpp initializeBackwardGraph.
	
	self assert: true description: 'No exception should be raised by this test'