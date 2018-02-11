utils
sizeOf: aMultidimensionalArray
	"Return the size of a multi-dimensional Array"

	^ aMultidimensionalArray isCollection
		ifTrue: [ aMultidimensionalArray isEmpty
				ifTrue: [ 0 ]
				ifFalse: [ aMultidimensionalArray sum: [ :each | self sizeOf: each ] ] ]
		ifFalse: [ 1 ]