operation description
description: aTF_OperationDescription set: aString toFloat: valueFloat
	"<cdecl: void 'TF_SetAttrFloat' (TF_OperationDescription* char* float)>"

	^ self
		ffiCall: #(void TF_SetAttrInt #(TF_OperationDescription * aTF_OperationDescription , String aString , float valueFloat))
		module: 'libtensorflow.dylib'