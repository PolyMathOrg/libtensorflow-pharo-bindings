other operations
mean: aCollectionOfNumbers
	
	aCollectionOfNumbers isEmpty ifTrue: [^0].
	^((aCollectionOfNumbers
		inject: 0
		into: [:subTotal :next | subTotal + next]) / aCollectionOfNumbers size)
		asFloat