graph
graph: aTF_Graph setShapeOf: aTF_OutputOrInput to: anInt64Array size: anInteger status: status
	"<cdecl: void 'TF_GraphSetTensorShape' (TF_Graph* TF_Output Int64Array* ulonglong TF_Status*)>"

^ self ffiCall: #(void TF_GraphSetTensorShape #(TF_Graph aTF_Graph, TF_Output aTF_OutputOrInput, Int64Array * aInt64Array, ulongulong anInteger, TF_Status aTF_Status)) module: 'libtensorflow.dylib'