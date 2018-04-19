graph
graph: aTF_Graph getShapeOf: aTF_OutputOrInput into: anInt64Array size: anInteger status: status
	"TF_CAPI_EXPORT extern void TF_GraphGetTensorShape(TF_Graph* graph,
                                                  TF_Output output,
                                                  int64_t* dims, int num_dims,
																TF_Status* status);"
	
^ self ffiCall: #(void TF_GraphGetTensorShape #(TF_Graph * aTF_Graph, TF_Output aTF_OutputOrInput, Int64Array * anInt64Array, int anInteger, TF_Status * status)) module: TensorFlowCAPI