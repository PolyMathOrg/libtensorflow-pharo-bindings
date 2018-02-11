testing operation
testAttrSetStringsInvalid
	| graph template in notAList |
	graph := TF_Graph create.
	template := #((1 2 3) (4 5 6) (7 8 9)).
	in := graph const: 'in' value: (TF_Tensor fromFloats: template).
	
	notAList := 'INVALID_ARGUMENT: AttrValue had value with type ''list(string)'' when ''string'' expected
	 for attr ''tensor_name''
	; NodeDef: out = DebugIdentity[T=DT_FLOAT, _class=[], debug_urls=[], tensor_name=["hola", "como", "estas?"]](in); Op<name=DebugIdentity; signature=input:T -> output:T; attr=T:type; attr=tensor_name:string,default=""; attr=debug_urls:list(string),default=[]; allows_uninitialized_input=true>'.

	self
		should: [
			graph newOperation: 'DebugIdentity' named: 'out' described: [:description |
				description at: 'tensor_name' putStrings: #('hola' 'como' 'estas?').
				description addInput: (in output: 0)]]
		raiseError: notAList.	