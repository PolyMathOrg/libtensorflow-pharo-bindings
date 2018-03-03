options
sessionOptions: aTF_SessionOptions setConfig: aString configSize: anInteger status: aTF_Status
	" not sure how to use this. Best information found in http://devdocs.io/tensorflow~python/contrib.learn#RunConfig"

	"<cdecl: void 'TF_SetConfig' (TF_SessionOptions* void* ulong TF_Status*)>"

	^ self
		ffiCall: #(void TF_SetConfig #(TF_SessionOptions * aTF_SessionOptions , String aString , size_t anInteger , TF_Status * aTF_Status))
		module: 'libtensorflow.dylib'