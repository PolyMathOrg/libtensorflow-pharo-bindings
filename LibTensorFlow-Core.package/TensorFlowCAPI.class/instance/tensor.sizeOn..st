tensor
tensor: aTF_Tensor sizeOn: dimension
	"<cdecl: longlong 'TF_Dim' (TF_Tensor* ulonglong)>"
	
	^ self
		ffiCall: #(int64 TF_Dim #(TF_Tensor * aTF_Tensor , int64 dimension))
		module: 'libtensorflow.dylib'