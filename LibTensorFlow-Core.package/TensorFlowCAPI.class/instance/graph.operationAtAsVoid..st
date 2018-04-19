operation
graph: aTF_Graph operationAtAsVoid: contextULongLongPtr
	"TF_CAPI_EXPORT extern TF_Operation* TF_GraphNextOperation(TF_Graph* graph, size_t* pos);"

	^ self ffiCall: #(TF_Operation * TF_GraphNextOperation #(TF_Graph * aTF_Graph, size_t * contextULongLongPtr)) module: TensorFlowCAPI