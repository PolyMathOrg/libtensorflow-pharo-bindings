operation description
description: aTF_OperationDescription set: aString toType: anInt
	"<cdecl: void 'TF_SetAttrType' (TF_OperationDescription* char* ulonglong)>"

	^ self
		ffiCall:
			#(void TF_SetAttrType #(TF_OperationDescription aTF_OperationDescription , String aString , ulonglong anInt))
		module: 'libtensorflow.dylib'