operation description
description: aTF_OperationDescription set: aString toType: anInt
	"TF_CAPI_EXPORT extern void TF_SetAttrType(TF_OperationDescription* desc,
                                          const char* attr_name, TF_DataType value);"

	^ self
		ffiCall:
			#(void TF_SetAttrType #(TF_OperationDescription * aTF_OperationDescription , String aString , int anInt))
		module: 'libtensorflow.dylib'