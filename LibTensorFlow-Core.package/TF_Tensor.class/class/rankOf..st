utils
rankOf: aMultidimensionalArray
	"Return the rank of a multi-dimensional Array"

	^ aMultidimensionalArray isCollection
		ifTrue: [ 1 + (self rankOf: aMultidimensionalArray first) ]
		ifFalse: [ 0 ]