options
sessionOptions: aTF_SessionOptions setConfig: aString configSize: anInteger status: aTF_Status
	" not sure how to use this. Best information found in http://devdocs.io/tensorflow~python/contrib.learn#RunConfig"

	"<TF_CAPI_EXPORT extern void TF_SetConfig(TF_SessionOptions* options,
                                        const void* proto, size_t proto_len,
													TF_Status* status);>"

	^ self
		ffiCall: #(void TF_SetConfig #(TF_SessionOptions * aTF_SessionOptions , String aString , size_t anInteger , TF_Status * aTF_Status))
		module: 'libtensorflow.dylib'