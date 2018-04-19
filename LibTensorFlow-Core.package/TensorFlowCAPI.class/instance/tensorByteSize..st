tensor
tensorByteSize: aTF_Tensor
	"TF_CAPI_EXPORT extern size_t TF_TensorByteSize(const TF_Tensor*);"

	^ self ffiCall: #(size_t TF_TensorByteSize #(TF_Tensor * aTF_Tensor)) module: TensorFlowCAPI