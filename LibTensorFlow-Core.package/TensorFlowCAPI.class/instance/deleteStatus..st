status
deleteStatus: aTF_Status
	"<cdecl: void 'TF_DeleteStatus' (TF_Status*)>"

	^ self ffiCall: #(void TF_DeleteStatus #(TF_Status * aTF_Status)) module: 'libtensorflow.dylib'