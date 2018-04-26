operation description
description: aTF_OperationDescription set: aString toShape: anInt64Array size: size
	"TF_CAPI_EXPORT extern void TF_SetAttrShape(TF_OperationDescription* desc,
                                           const char* attr_name, const int64_t* dims, int num_dims);"
	
	
	^ self ffiCall: #(void TF_SetAttrShape #(TF_OperationDescription * aTF_OperationDescription, String aString, int64 * anInt64Array, int size)) module: TensorFlowCAPI