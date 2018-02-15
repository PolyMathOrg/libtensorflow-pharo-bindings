operation
graph: aTF_Graph operationAtAsVoid: contextULongLongPtr
	"<cdecl: void* 'TF_GraphNextOperation' (TF_Graph* ulonglong*)>"

	^ self ffiCall: #(void * TF_GraphNextOperation #(TF_Graph * aTF_Graph, ulonglong * contextULongLongPtr)) module: 'libtensorflow.dylib'