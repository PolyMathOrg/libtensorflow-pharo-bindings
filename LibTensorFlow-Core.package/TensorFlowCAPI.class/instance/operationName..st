operation
operationName: aTF_Operation
	"<cdecl: char* 'TF_OperationName' (TF_Operation*)>"

	^ self ffiCall: #(String TF_OperationName #(TF_Operation aTF_Operation)) module: 'libtensorflow.dylib'