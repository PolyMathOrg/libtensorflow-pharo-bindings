operation
operation: aTF_Operation attr: nameZString getInt64: valueLongPtr status: status
	"TF_CAPI_EXPORT extern void TF_OperationGetAttrInt(TF_Operation* oper,
                                                  const char* attr_name,
                                                  int64_t* value, TF_Status* status);"

	^ self
		ffiCall: #(void TF_OperationGetAttrInt #(TF_Operation * aTF_Operation , String nameZString , int64 * valueLongPtr , TF_Status * status))
		module: TensorFlowCAPI