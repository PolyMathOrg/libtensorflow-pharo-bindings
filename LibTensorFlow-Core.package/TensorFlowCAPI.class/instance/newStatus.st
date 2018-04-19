status
newStatus
	"<cdecl: TF_Status* 'TF_NewStatus' (void)>"

	^ self ffiCall: #(TF_Status * TF_NewStatus #()) module: TensorFlowCAPI