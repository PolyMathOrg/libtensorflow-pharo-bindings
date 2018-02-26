operation
operationOutputType: aTF_Output
	"<cdecl: ulonglong 'TF_OperationOutputType' (TF_Output)>"

	^ self
		ffiCall: #(ulonglong TF_OperationOutputType #(TF_Output aTF_Output))
		module: 'libtensorflow.dylib'