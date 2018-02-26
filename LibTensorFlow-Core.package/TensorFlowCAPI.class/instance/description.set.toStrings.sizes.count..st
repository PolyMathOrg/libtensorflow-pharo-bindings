operation description
description: aTF_OperationDescription set: aString toStrings: anArrayOfString sizes: sizes count: count
	"<cdecl: void 'TF_SetAttrStringList' (TF_OperationDescription* char* void* Int64Array* longlong)>"

	^ self
		ffiCall:
			#(void TF_SetAttrStringList #(TF_OperationDescription * aTF_OperationDescription , String aString , void * anArrayOfStrings , Int64Array * sizes , longlong count))
		module: 'libtensorflow.dylib'