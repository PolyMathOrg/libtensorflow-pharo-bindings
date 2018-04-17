operation description
description: aTF_OperationDescription set: aString toInt64: anInt
	"<cdecl: void 'TF_SetAttrInt' (TF_OperationDescription* char* ulonglong)>"

	^ self
		ffiCall: #(void TF_SetAttrInt #(TF_OperationDescription * aTF_OperationDescription , String aString , int64 anInt))
		module: 'libtensorflow.dylib'