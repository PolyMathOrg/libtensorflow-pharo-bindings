testing strings
testTensorFromStringArray
	| tensor template |
	template := #('hola manola' 'te traje una lola' 'pamela' 'que pandulce!').
	tensor := TF_Tensor fromStringArray: template.
	self assert: tensor allStrings equals: template