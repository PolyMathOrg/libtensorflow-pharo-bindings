operation description
description: desc set: attr_name toString: value size: size
	"TF_CAPI_EXPORT extern void TF_SetAttrString(TF_OperationDescription* desc,
                                            const char* attr_name, const void* value, size_t length);"

	^ self
		ffiCall:
			#(void TF_SetAttrString #(TF_OperationDescription * desc , String attr_name , String value , size_t size))
		module: 'libtensorflow.dylib'