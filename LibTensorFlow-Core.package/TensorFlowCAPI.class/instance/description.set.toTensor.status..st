operation description
description: aTF_OperationDescription set: aString toTensor: aTF_Tensor status: aTF_Status
	"<cdecl: void 'TF_SetAttrTensor' (TF_OperationDescription* char* TF_Tensor* TF_Status*)>"
	^ self
		ffiCall:
			#(void TF_SetAttrTensor #(TF_OperationDescription aTF_OperationDescription , String aString , TF_Tensor * aTF_Tensor, TF_Status * aTF_Status))
		module: 'libtensorflow.dylib'