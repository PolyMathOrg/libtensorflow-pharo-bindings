options
deleteSessionOptions: aTF_SessionOptions
	"<cdecl: void 'TF_DeleteSessionOptions' (TF_SessionOptions*)>"

	^ self ffiCall: #(void TF_DeleteSessionOptions #(TF_SessionOptions aTF_SessionOptions)) module: 'libtensorflow.dylib'