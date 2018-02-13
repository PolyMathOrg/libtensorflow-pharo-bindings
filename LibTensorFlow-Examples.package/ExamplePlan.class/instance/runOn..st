running
runOn: inputValues
	| results |	
		
	results := session
		runInputs: inputs
		values: inputValues
		outputs: outputs.
		
	^ results first
	