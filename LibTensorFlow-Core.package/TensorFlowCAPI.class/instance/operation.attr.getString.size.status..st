operation
operation: aTF_Operation attr: nameZString getString: valueString size: maxSize status: status
	"TF_CAPI_EXPORT extern void TF_OperationGetAttrString(TF_Operation* oper,
                                                     const char* attr_name,
                                                     void* value,
                                                     size_t max_length,
																	TF_Status* status);"

	^ self
		ffiCall: #(void TF_OperationGetAttrString #(TF_Operation * aTF_Operation , String nameZString , void * valueString , size_t maxSize , TF_Status * status))
		module: 'libtensorflow.dylib'