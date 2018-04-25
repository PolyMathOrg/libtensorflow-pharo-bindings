instance creation
newGraphAsVoid
	"F_CAPI_EXPORT extern TF_Graph* TF_NewGraph();"

	^ self ffiCall: #(TF_Graph * TF_NewGraph #()) module: TensorFlowCAPI