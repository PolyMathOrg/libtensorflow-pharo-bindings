status
getCode: aTF_Status
	"<cdecl: ulong 'TF_GetCode' (TF_Status*)>"

	^ self ffiCall: #(ulong TF_GetCode #(TF_Status * aTF_Status)) module: TensorFlowCAPI