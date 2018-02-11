accessing
allInitializers
	^ self operationsSelect: [ :op | op type = 'Assign' and: [ op name endsWith: '_initializer' ] ]