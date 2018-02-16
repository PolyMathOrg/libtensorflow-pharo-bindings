operation description
description: aTF_OperationDescription set: nameString toString: valueString size: size
	"<cdecl: void 'TF_SetAttrString' (TF_OperationDescription* char* char* ulonglong)>"

	^ self
		ffiCall:
			#(void TF_SetAttrString #(TF_OperationDescription * aTF_OperationDescription , String nameString , String valueString , ulonglong size))
		module: 'libtensorflow.dylib'