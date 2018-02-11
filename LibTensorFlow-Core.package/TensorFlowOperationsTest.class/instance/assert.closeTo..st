initialization
assert: aNumber closeTo: anotherNumber
	^ self
		assert: (aNumber closeTo: anotherNumber)
		description: (self comparingStringBetween: aNumber and: anotherNumber)
