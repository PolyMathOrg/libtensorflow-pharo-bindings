operation description
description: aTF_OperationDescription setDevice: aString
	"<cdecl: void 'TF_SetDevice' (TF_OperationDescription* char*)>"

	^ self
		ffiCall:
			#(void TF_SetDevice #(TF_OperationDescription * aTF_OperationDescription , String aString))
		module: 'libtensorflow.dylib'