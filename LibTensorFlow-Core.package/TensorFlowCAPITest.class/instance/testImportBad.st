testing graph
testImportBad
	| graph buffer |
	graph := TF_Graph create.
	buffer := TF_Buffer fromString: 'ouch'.
	
	self
		should: [graph import: buffer]
		raiseError: 'INVALID_ARGUMENT: Invalid GraphDef'.
	
	buffer delete.