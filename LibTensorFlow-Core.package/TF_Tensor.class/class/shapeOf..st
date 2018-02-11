utils
shapeOf: aMultidimensionalArray
	"Return the shape of a multi-dimensioanal Array"

	^ aMultidimensionalArray isCollection
		ifTrue: [ aMultidimensionalArray isEmpty
				ifTrue: [ #(0) ]
				ifFalse: [ {aMultidimensionalArray size} , (self shapeOf: aMultidimensionalArray first) ] ]
		ifFalse: [ #() ]