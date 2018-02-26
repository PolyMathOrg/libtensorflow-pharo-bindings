testing-NearesNeighbor
testNearestNeighbor: plan
	| first second third closest references tensorReference tensors predictor |
	first := #(0 0 0 0 0).
	second := #(1 1 3 4 2).
	third := #(8 1 3 4 2).
	references := {
		first.
		second.
		third}.
	tensorReference := self tensorFrom: references.
	tensors := references collect: [ :point |
		self tensorFrom: {point} ].
	
	predictor := [:unknown | | result | 
		result := plan predict: unknown from: tensorReference.
		result first].
	
	closest := predictor value: tensors first.
	self assert: closest equals: 1.
	
	closest := predictor value:  tensors second.
	self assert: closest equals: 2.
	
	closest := predictor value:  tensors third.
	self assert: closest equals: 3.