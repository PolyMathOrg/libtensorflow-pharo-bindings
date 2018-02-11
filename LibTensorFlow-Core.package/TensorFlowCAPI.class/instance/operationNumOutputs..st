operation
operationNumOutputs: aTF_Operation
	"<cdecl: long 'TF_OperationNumOutputs' (TF_Operation*)>"

	^ self
		ffiCall: #(long TF_OperationNumOutputs #(TF_Operation aTF_Operation))
		module: 'libtensorflow.dylib'