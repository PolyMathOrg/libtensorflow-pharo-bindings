session
newSession: aTF_Graph options: aTF_SessionOptions status: aTF_Status
	"<cdecl: TF_Session* 'TF_NewSession' (TF_Graph* TF_SessionOptions* TF_Status*)>"

	^ self
		ffiCall: #(TF_Session * TF_NewSession #(TF_Graph * aTF_Graph, TF_SessionOptions * aTF_SessionOptions, TF_Status * aTF_Status))
		module: TensorFlowCAPI