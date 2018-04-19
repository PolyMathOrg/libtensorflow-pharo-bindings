status
message: aTF_Status
	"<cdecl: char* 'TF_Message' (TF_Status*)>"

	^ self ffiCall: #(String TF_Message #(TF_Status * aTF_Status)) module: 'libtensorflow.dylib'