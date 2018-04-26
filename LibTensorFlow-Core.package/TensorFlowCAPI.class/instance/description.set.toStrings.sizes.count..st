operation description
description: aTF_OperationDescription set: aString toStrings: anArrayOfString sizes: sizes count: count
	"TF_CAPI_EXPORT extern void TF_SetAttrStringList(TF_OperationDescription* desc,
                                                const char* attr_name,
                                                const void* const* values,
                                                const size_t* lengths,
															  int num_values);"

	^ self
		ffiCall:
			#(void TF_SetAttrStringList #(TF_OperationDescription * aTF_OperationDescription , String aString , void * anArrayOfString , int64 * sizes , int count))
		module: TensorFlowCAPI