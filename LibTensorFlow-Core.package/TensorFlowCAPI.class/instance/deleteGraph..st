graph
deleteGraph: aTF_Graph
	"<cdecl: void 'TF_DeleteGraph' (TF_Graph*)>"

	^ self ffiCall: #(void TF_DeleteGraph #(TF_Graph * aTF_Graph)) module: TensorFlowCAPI