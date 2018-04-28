operation description
description: aTF_OperationDescription addInputs: aTF_OutputArray size: anInteger
	"<TF_CAPI_EXPORT extern void TF_AddInputList(TF_OperationDescription* desc,
                                           const TF_Output* inputs, int num_inputs);>"

	^ self
		ffiCall:
			#(void TF_AddInputList #(TF_OperationDescription * aTF_OperationDescription , #TF_OutputArrayOld * aTF_OutputArray , int anInteger))
		module: TensorFlowCAPI