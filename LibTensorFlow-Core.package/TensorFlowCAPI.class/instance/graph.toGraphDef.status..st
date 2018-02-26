graph
graph: aTF_Graph toGraphDef: aTF_Buffer status: aTF_Status
	"<cdecl: void 'TF_GraphToGraphDef' (TF_Graph* TF_Buffer* TF_Status*)>"

	^ self
		ffiCall: #(void TF_GraphToGraphDef #(TF_Graph * aTF_Graph , TF_Buffer * aTF_Buffer , TF_Status * aTF_Status))
		module: 'libtensorflow.dylib'