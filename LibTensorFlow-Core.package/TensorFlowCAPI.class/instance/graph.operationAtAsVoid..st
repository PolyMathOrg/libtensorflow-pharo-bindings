operation
graph: graph operationAtAsVoid: pos
	"TF_CAPI_EXPORT extern TF_Operation* TF_GraphNextOperation(TF_Graph* graph, size_t* pos);"

	^ self
		ffiCall: #(TF_Operation * TF_GraphNextOperation #(TF_Graph * graph , size_t * pos))
		module: TensorFlowCAPI