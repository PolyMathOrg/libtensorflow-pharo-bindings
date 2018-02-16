graph
graph: aTF_Graph getShapeOf: aTF_OutputOrInput into: anInt64Array size: anInteger status: status
	"<cdecl: ulonglong 'TF_GraphGetTensorShape' (TF_Graph* TF_Output Int64Array* ulonglong TF_Status*)>"
	
^ self ffiCall: #(ulonglong TF_GraphGetTensorShape #(TF_Graph * aTF_Graph, TF_Output aTF_OutputOrInput, Int64Array * anInt64Array, ulonglong anInteger, TF_Status * status)) module: 'libtensorflow.dylib'