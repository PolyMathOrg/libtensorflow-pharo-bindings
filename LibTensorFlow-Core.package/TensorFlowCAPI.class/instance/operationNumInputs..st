operation
operationNumInputs: aTF_Operation
	"<cdecl: long 'TF_OperationNumInputs' (TF_Operation*)>"

	^ self
		ffiCall: #(long TF_OperationNumInputs #(TF_Operation * aTF_Operation))
		module: 'libtensorflow.dylib'