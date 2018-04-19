operation
operationNumOutputs: aTF_Operation
	"TF_CAPI_EXPORT extern int TF_OperationNumOutputs(TF_Operation* oper)"

	^ self
		ffiCall: #(int TF_OperationNumOutputs #(TF_Operation * aTF_Operation))
		module: TensorFlowCAPI