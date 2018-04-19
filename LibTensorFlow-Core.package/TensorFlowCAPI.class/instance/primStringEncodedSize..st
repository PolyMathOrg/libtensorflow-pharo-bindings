strings
primStringEncodedSize: anInteger
	"TF_CAPI_EXPORT extern size_t TF_StringEncodedSize(size_t len)"

	^ self ffiCall: #(size_t TF_StringEncodedSize #(size_t anInteger)) module: TensorFlowCAPI