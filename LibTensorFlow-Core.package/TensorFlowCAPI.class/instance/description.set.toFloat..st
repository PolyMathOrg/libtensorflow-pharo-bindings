operation description
description: aTF_OperationDescription set: aString toFloat: valueFloat
	"TF_CAPI_EXPORT extern void TF_SetAttrFloat(TF_OperationDescription* desc, const char* attr_name, float value);"

	^ self
		ffiCall: #(void TF_SetAttrFloat #(TF_OperationDescription * aTF_OperationDescription , String aString , float valueFloat))
		module: TensorFlowCAPI