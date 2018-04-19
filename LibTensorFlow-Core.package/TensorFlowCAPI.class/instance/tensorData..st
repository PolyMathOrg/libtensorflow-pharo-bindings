tensor
tensorData: aTF_Tensor
	"TF_CAPI_EXPORT extern void* TF_TensorData(const TF_Tensor*)"

	^ self
		ffiCall: #(void * TF_TensorData #(TF_Tensor * aTF_Tensor))
		module: TensorFlowCAPI