operation
operationOpType: aTF_Operation
	"<cdecl: char* 'TF_OperationOpType' (TF_Operation*)>"

	^ self ffiCall: #(String TF_OperationOpType #(TF_Operation * aTF_Operation)) module: TensorFlowCAPI