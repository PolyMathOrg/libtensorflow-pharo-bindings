private
predict: images andCompareTo: labels
	| equals result |
	result := (plan predict: images) asNumbers.
	equals := result
		with: labels
		collect: [ :x :y | 
			x = y
				ifTrue: [ 1 ]
				ifFalse: [ 0 ] ].
	^ equals mean asFloat