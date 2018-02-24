operation description
description: aTF_OperationDescription set: aString toBool: anInt
	"<cdecl: void 'TF_SetAttrBool' (TF_OperationDescription* char* byte)>"

	^ self
		ffiCall: #(void TF_SetAttrInt #(TF_OperationDescription * aTF_OperationDescription , String aString , byte anInt))
		module: 'libtensorflow.dylib'