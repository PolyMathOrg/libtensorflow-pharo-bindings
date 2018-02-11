graph
graph: aTF_Graph getShapeOf: aTF_OutputOrInput into: anInt64Array size: anInteger status: status
	"<cdecl: ulonglong 'TF_GraphGetTensorShape' (TF_Graph* TF_Output Int64Array* ulonglong TF_Status*)>"
	
^ self ffiCall: #(ulongulong TF_GraphGetTensorShape #(TF_Graph aTF_Graph, TF_Output aTF_OutputOrInput, Int64Array * aInt64Array, ulongulong anInteger, TF_Status aTF_Status)) module: 'libtensorflow.dylib'