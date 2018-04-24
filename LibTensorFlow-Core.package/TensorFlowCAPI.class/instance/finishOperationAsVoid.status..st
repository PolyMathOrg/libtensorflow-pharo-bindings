operation description
finishOperationAsVoid: desc status: status
	"TF_CAPI_EXPORT extern TF_Operation* TF_FinishOperation(TF_OperationDescription* desc, TF_Status* status);"
	
	^ self
		ffiCall:
			#(TF_Operation * TF_FinishOperation #(TF_OperationDescription * desc , TF_Status * status))
		module: TensorFlowCAPI