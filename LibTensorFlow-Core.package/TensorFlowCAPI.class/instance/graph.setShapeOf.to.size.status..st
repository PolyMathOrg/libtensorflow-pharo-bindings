graph
graph: aTF_Graph setShapeOf: aTF_OutputOrInput to: anInt64Array size: anInteger status: status
	"<cdecl: void 'TF_GraphSetTensorShape' (TF_Graph* TF_Output Int64Array* ulonglong TF_Status*)>"

^ self ffiCall: #(void TF_GraphSetTensorShape #(TF_Graph * aTF_Graph, TF_Output aTF_OutputOrInput, Int64Array * anInt64Array, int anInteger, TF_Status * status)) module: TensorFlowCAPI