status
setStatus: aTF_Status code: anInteger message: anExternalString
	"TF_CAPI_EXPORT extern void TF_SetStatus(TF_Status* s, TF_Code code, const char* msg);"

	^ self ffiCall: #(void TF_SetStatus #(TF_Status * aTF_Status , ulong anInteger , String anExternalString)) module: 'libtensorflow.dylib'