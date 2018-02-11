tensor
tensorData: aTF_Tensor
	"<cdecl: void* 'TF_TensorData' (TF_Tensor*)>"

	^ self
		ffiCall: #(void * TF_TensorData #(TF_Tensor aTF_Tensor))
		module: 'libtensorflow.dylib'