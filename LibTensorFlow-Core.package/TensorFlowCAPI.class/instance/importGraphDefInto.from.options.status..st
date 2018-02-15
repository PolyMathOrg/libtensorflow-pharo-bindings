graph
importGraphDefInto: aTF_Graph from: aTF_Buffer options: aTF_ImportGraphDefOptions status: aTF_Status
	"<cdecl: void 'TF_GraphImportGraphDef' (TF_Graph* TF_Buffer* TF_ImportGraphDefOptions* TF_Status*)>"

	^ self ffiCall: #(void TF_GraphImportGraphDef #(TF_Graph * aTF_Graph, TF_Buffer aTF_Buffer, TF_ImportGraphDefOptions aTF_ImportGraphDefOptions, TF_Status * aTF_Status)) module: 'libtensorflow.dylib'