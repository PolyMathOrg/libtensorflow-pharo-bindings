operation description
finishOperationAsVoid: aTF_OperationDescription status: aTF_Status
	"<cdecl: void* 'TF_FinishOperation' (TF_OperationDescription* TF_Status*)>"
	
	^ self
		ffiCall:
			#(void * TF_FinishOperation #(TF_OperationDescription * aTF_OperationDescription , TF_Status * aTF_Status))
		module: 'libtensorflow.dylib'