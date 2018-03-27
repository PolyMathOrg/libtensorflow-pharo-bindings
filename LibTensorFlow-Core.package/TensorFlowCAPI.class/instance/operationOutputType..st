operation
operationOutputType: aTF_Output
	"<cdecl: TF_DataType 'TF_OperationOutputType' (TF_Output)>"

	^ self
		ffiCall: #(long TF_OperationOutputType #(TF_Output aTF_Output))
		module: 'libtensorflow.dylib'