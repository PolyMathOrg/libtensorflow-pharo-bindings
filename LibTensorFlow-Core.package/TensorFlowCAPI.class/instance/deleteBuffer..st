buffer
deleteBuffer: aTF_Buffer
	"<cdecl: void 'TF_DeleteBuffer' (TF_Buffer*)>"

	^ self
		ffiCall: #(void TF_DeleteBuffer #(TF_Buffer * aTF_Buffer))
		module: TensorFlowCAPI