operation description
description: aTF_OperationDescription addInputs: aTF_OutputArray size: anInteger
	"<cdecl: void 'TF_AddInputList' (TF_OperationDescription* TF_OutputArray* longlong)>"

	^ self
		ffiCall:
			#(void TF_AddInputList #(TF_OperationDescription * aTF_OperationDescription , TF_OutputArray * aTF_OutputArray , longlong anInteger))
		module: 'libtensorflow.dylib'