tensor
deleteTensor: aTF_Tensor
	"<cdecl: void 'TF_DeleteTensor' (TF_Tensor*)>"

	^ self
		ffiCall: #(void TF_DeleteTensor #(TF_Tensor * aTF_Tensor))
		module: TensorFlowCAPI