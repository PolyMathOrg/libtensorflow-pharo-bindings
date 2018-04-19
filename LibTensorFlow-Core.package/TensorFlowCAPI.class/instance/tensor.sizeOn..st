tensor
tensor: aTF_Tensor sizeOn: dimension
	"TF_CAPI_EXPORT extern int64_t TF_Dim(const TF_Tensor* tensor, int dim_index);"
	
	^ self
		ffiCall: #(int64 TF_Dim #(TF_Tensor * aTF_Tensor , int dimension))
		module: TensorFlowCAPI