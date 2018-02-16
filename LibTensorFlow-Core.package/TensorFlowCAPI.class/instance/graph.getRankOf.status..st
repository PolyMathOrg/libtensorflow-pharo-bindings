graph
graph: aTF_Graph getRankOf: aTF_OutputOrInput status: status
	"<cdecl: ulonglong 'TF_GraphGetTensorNumDims' (TF_Graph* TF_Output TF_Status*)>"

	^ self ffiCall: #(ulonglong TF_GraphGetTensorNumDims #(TF_Graph * aTF_Graph, TF_Output aTF_OutputOrInput, TF_Status * status)) module: 'libtensorflow.dylib'