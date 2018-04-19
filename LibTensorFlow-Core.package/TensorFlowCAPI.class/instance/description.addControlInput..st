operation description
description: aTF_OperationDescription addControlInput: aTF_Output
	"<cdecl: void 'TF_AddControlInput' (TF_OperationDescription* TF_Output)>"

	^ self
		ffiCall:
			#(void TF_AddControlInput #(TF_OperationDescription * aTF_OperationDescription , TF_Output aTF_Output))
		module: TensorFlowCAPI