tensor
tensorByteSize: aTF_Tensor
	"<cdecl: ulonglong 'TF_TensorByteSize' (TF_Tensor*)>"

	^ self ffiCall: #(ulonglong TF_TensorByteSize #(TF_Tensor aTF_Tensor)) module: 'libtensorflow.dylib'