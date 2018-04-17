operation description
description: desc set: attr_name toBool: value
	"TF_CAPI_EXPORT extern void TF_SetAttrBool(TF_OperationDescription* desc,
                                          const char* attr_name, unsigned char value);"

	^ self
		ffiCall: #(void TF_SetAttrBool #(TF_OperationDescription * desc , String attr_name , bool value))
		module: 'libtensorflow.dylib'