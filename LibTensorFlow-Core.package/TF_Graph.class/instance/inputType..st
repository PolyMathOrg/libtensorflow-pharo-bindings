root operations
inputType: typeInteger
	^ self
		newOperation: 'Placeholder'
		named: (self nameFor: 'input')
		described: [:description |
			description at: 'dtype' putType: typeInteger]