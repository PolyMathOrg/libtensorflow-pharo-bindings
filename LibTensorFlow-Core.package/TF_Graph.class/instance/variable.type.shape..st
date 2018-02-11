root operations
variable: nameString type: typeInteger shape: anArray
	^ self
		newOperation: 'Variable'
		named: nameString
		described: [:description |
			description
				at: 'dtype' putType: typeInteger;
				at: 'shape' putShape: anArray]