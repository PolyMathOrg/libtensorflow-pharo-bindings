operation description
description: aTF_OperationDescription set: aString toShape: anInt64Array size: size
	"<cdecl: void 'TF_SetAttrShape' (TF_OperationDescription* char* Int64Array* ulonglong)>"
	
	
	^ self ffiCall: #(void TF_SetAttrShape #(TF_OperationDescription * aTF_OperationDescription, String aString, Int64Array * anInt64Array, ulonglong size)) module: 'libtensorflow.dylib'