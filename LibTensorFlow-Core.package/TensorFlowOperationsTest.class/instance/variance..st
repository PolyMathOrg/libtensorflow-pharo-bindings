other operations
variance: aCollectionOfNumbers
	| moy |
	aCollectionOfNumbers isEmpty
		ifTrue: [ ^ 0 ].
	moy := self mean: aCollectionOfNumbers.
	^ ((aCollectionOfNumbers inject: 0 into: [ :subTotal :next | subTotal + (next - moy) squared ])
		/ aCollectionOfNumbers size) asFloat