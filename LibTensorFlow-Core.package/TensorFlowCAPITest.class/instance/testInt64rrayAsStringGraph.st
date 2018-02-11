testing operation
testInt64rrayAsStringGraph
	| result tensor strings template |
	
	template := #(101010101 -123321 1 2 3 4).
	tensor := TF_Tensor fromInt64s: template.
	result := self testAsStringGraphRunOn: tensor.
	strings := result allStrings.
	
	strings withIndexDo: [:value :index |
		self assert: value equals: (template at: index) asString].
	
	result delete.