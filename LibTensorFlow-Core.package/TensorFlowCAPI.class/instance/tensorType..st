tensor
tensorType: aTF_Tensor
	"<cdecl: ulonglong 'TF_TensorType' (TF_Tensor*)>"
^ self
		ffiCall: #(ulonglong TF_TensorType #(TF_Tensor * aTF_Tensor))
		module: TensorFlowCAPI