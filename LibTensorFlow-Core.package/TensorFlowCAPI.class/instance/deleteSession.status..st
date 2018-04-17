session
deleteSession: aTF_Session status: aTF_Status
	"TF_CAPI_EXPORT extern void TF_DeleteSession(TF_Session*, TF_Status* status);"

	^ self
		ffiCall:
			#(void TF_DeleteSession #(TF_Session * aTF_Session , TF_Status * aTF_Status))
		module:
			'libtensorflow.dylib'