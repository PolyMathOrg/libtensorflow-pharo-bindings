operation description
description: aTF_OperationDescription set: aString toBool: anInt
	"TF_CAPI_EXPORT extern void TF_SetAttrBool(TF_OperationDescription* desc,
                                          const char* attr_name, unsigned char value);"

	^ self
		ffiCall: #(void TF_SetAttrInt #(TF_OperationDescription * aTF_OperationDescription , String aString , bool anInt))
		module: 'libtensorflow.dylib'