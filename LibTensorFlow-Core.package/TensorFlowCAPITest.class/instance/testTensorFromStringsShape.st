testing strings
testTensorFromStringsShape
	| template |
	template := #('hola manola' 'te traje una lola' 'pamela' 'que pandulce!' 'habia una vez' 'truz').
	self assertTensorFromStrings: template shape: #(6).
	self assertTensorFromStrings: template shape: #(3 2).
	self assertTensorFromStrings: template shape: #(1 1 6 1 1).
	self assertTensorFromStrings: #('hola como estas?') shape: #()