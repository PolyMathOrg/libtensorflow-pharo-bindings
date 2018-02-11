graph
graph: aTF_Graph getOperationNamedAsVoid: aString
	"<cdecl: void* 'TF_GraphOperationByName' (TF_Graph* char*)>"


	^ self ffiCall: #(void * TF_GraphOperationByName #(TF_Graph aTF_Graph, String aString)) module: 'libtensorflow.dylib'