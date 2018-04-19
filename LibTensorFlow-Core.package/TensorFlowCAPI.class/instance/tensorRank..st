tensor
tensorRank: aTF_Tensor
	"<cdecl: longlong 'TF_NumDims' (TF_Tensor*)>"

	^ self
		ffiCall: #(int TF_NumDims #(TF_Tensor * aTF_Tensor))
		module: TensorFlowCAPI