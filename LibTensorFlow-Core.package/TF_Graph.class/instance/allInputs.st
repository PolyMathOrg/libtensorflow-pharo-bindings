accessing
allInputs
	^ self operationsSelect: [ :op | op type = 'Placeholder' ]