tensor
allocateTensorType: anInteger shape: aLongLongArray rank: dimCount length: len
	"TF_CAPI_EXPORT extern TF_Tensor* TF_AllocateTensor(TF_DataType,
                                                   const int64_t* dims, int num_dims, size_t len);"

	^ self
		ffiCall: #(
		TF_Tensor * TF_AllocateTensor #(
			int anInteger,
			int64 * aLongLongArray,
			int dimCount,
			size_t len))
		module: TensorFlowCAPI