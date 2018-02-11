testing strings
testTensorFromStrings
	| tensor template flatten |
	template := #(#('hola manola' 'te traje una lola') #('pamela' 'que pandulce!') #('habia una vez' 'truz')).
	flatten := TF_Tensor elementsOf: template.
	tensor := TF_Tensor fromStrings: template.
	self assert: #(3 2) equals: tensor shape.
	self assert: flatten equals: tensor allStrings