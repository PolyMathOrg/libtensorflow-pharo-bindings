training
learn: sample with: expected
	| results |	
	results := session
		runInputs: {inputs first. target input: 0}
		values: {sample. expected}
		outputs: {learn output: 0. delta output: 0}.
	
	lastDelta := results at: 2.
	^ results first
	