operation description
description: desc set: attr_name toInt64: value
	"TF_CAPI_EXPORT extern void TF_SetAttrInt(TF_OperationDescription* desc,
const char* attr_name, int64_t value);"

	^ self
		ffiCall: #(void TF_SetAttrInt #(TF_OperationDescription * desc , String attr_name , int64 value))
		module: 'libtensorflow.dylib'