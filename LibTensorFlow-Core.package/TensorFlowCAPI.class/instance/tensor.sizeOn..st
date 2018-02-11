tensor
tensor: aTF_Tensor sizeOn: dimension
	"<cdecl: longlong 'TF_Dim' (TF_Tensor* ulonglong)>"

	^ self
		ffiCall: #(longlong TF_Dim #(TF_Tensor aTF_Tensor , int dimension))
		module: 'libtensorflow.dylib'