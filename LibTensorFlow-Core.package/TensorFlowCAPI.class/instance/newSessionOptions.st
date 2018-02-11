options
newSessionOptions
	"<cdecl: TF_SessionOptions* 'TF_NewSessionOptions' (void)>"

	^ self ffiCall: #(TF_SessionOptions * TF_NewSessionOptions #()) module: 'libtensorflow.dylib'