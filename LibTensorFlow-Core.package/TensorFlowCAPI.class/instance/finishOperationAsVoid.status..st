operation description
finishOperationAsVoid: aTF_OperationDescription status: aTF_Status
	"TF_CAPI_EXPORT extern TF_Operation* TF_FinishOperation(TF_OperationDescription* desc, TF_Status* status);"
	
	^ self
		ffiCall:
			#(void * TF_FinishOperation #(TF_OperationDescription * aTF_OperationDescription , TF_Status * aTF_Status))
		module: TensorFlowCAPI