operation
operation: aTF_Operation attr: nameZString getShape: int64array size: maxSize status: status
	"TF_CAPI_EXPORT extern void TF_OperationGetAttrShape(TF_Operation* oper,
                                                    const char* attr_name,
                                                    int64_t* value,
                                                    int num_dims, TF_Status* status);"

	^ self
		ffiCall: #(void TF_OperationGetAttrShape #(TF_Operation * aTF_Operation , String nameZString , Int64Array * int64array , int maxSize, TF_Status * status))
		module: TensorFlowCAPI