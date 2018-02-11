status
setStatus: aTF_Status code: anInteger message: anExternalString
	"<cdecl: void 'TF_SetStatus' (TF_Status* ulong char*)>"

	^ self ffiCall: #(void TF_SetStatus #(TF_Status aTF_Status , ulong anInteger , String anExternalString)) module: 'libtensorflow.dylib'