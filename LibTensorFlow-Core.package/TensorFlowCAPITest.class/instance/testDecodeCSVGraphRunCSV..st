testing operation
testDecodeCSVGraphRunCSV: csvLines
	| defaults graph output records session results values |
	defaults := {
		TF_Tensor fromInt64s: #(-1).
		TF_Tensor fromInt64s: #(-1).
		TF_Tensor fromInt64s: #(-1).
		TF_Tensor fromInt64s: #(-1)}.
		
	graph := self decodeCSVGraphDefaults: defaults.
	records := (graph operationNamed: 'records') input: 0.
	output := graph operationNamed: 'output'.
	values := TF_Tensor fromStringArray: csvLines.
	
	session := TF_Session on: graph.
	results := session
		runOperations: {output}
		inputs: {records}
		values: {values}
		outputs: {
			(output output: 0).
			(output output: 1).
			(output output: 2).
			(output output: 3)}.
	^ (1 to: 4) collect: [:i |
		(results at: i) allInt64s].
