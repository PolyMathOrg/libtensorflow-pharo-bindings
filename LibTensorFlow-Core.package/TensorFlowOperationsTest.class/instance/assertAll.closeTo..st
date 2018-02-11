initialization
assertAll: expectedArray closeTo: actualArray
	expectedArray with: actualArray do: [:expected :actual |
		self assert: expected closeTo: actual]