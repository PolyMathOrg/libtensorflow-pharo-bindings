instance creation
newGraphAsVoid
	"<cdecl: void* 'TF_NewGraph' (void)>"

	^ self ffiCall: #(void * TF_NewGraph #()) module: TensorFlowCAPI