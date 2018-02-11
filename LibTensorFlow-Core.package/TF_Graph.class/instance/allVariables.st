accessing
allVariables
	^ self operationsSelect: [ :op | op type = 'Variable' ]