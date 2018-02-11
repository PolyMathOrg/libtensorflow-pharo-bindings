session
closeSession: aTF_Session status: aTF_Status
	"<cdecl: void 'TF_CloseSession' (TF_Session* TF_Status*)>"

	^ self ffiCall: #(void TF_CloseSession #(TF_Session aTF_Session, TF_Status aTF_Status)) module: 'libtensorflow.dylib'