options
sessionOptions: aTF_SessionOptions setTarget: aString
	"<cdecl: void 'TF_SetTarget' (TF_SessionOptions* char*)>"

	^ self
		ffiCall: #(void TF_SetTarget #(TF_SessionOptions * aTF_SessionOptions , String aString))
		module: TensorFlowCAPI