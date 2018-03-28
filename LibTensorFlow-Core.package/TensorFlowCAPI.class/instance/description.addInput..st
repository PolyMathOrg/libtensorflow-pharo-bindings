operation description
description: aTF_OperationDescription addInput: aTF_Output
	"<cdecl: void 'TF_AddInput' (TF_OperationDescription* TF_Output)>"
	
	^ self
		ffiCall:
			#(void TF_AddInput #(TF_OperationDescription * aTF_OperationDescription , TF_Output aTF_Output))
		module: 'libtensorflow.dylib'