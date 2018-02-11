utils
elementsOf: tensorArray do: oneArgBlock
	^ (tensorArray isCollection and: [ tensorArray isString not ])
		ifTrue: [ tensorArray do: [ :each | self elementsOf: each do: oneArgBlock ] ]
		ifFalse: [ oneArgBlock value: tensorArray ]