operation
operationDevice: aTF_Operation
	"<cdecl: char* 'TF_OperationDevice' (TF_Operation*)>"

	^ self ffiCall: #(String TF_OperationDevice #(TF_Operation * aTF_Operation)) module: TensorFlowCAPI