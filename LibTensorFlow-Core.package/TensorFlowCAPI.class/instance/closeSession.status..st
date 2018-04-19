session
closeSession: aTF_Session status: aTF_Status
	"TF_CAPI_EXPORT extern void TF_CloseSession(TF_Session*, TF_Status* status);"

	^ self ffiCall: #(void TF_CloseSession #(TF_Session * aTF_Session, TF_Status * aTF_Status)) module: TensorFlowCAPI