operation
operation: aTF_Operation attr: nameZString getStrings: valueStringArray sizes: sizesArray maxCount: maxCount storage: aBytaArray size: storageSize status: status
	"TF_CAPI_EXPORT extern void TF_OperationGetAttrStringList(
    TF_Operation* oper, const char* attr_name, void** values, size_t* lengths,
int max_values, void* storage, size_t storage_size, TF_Status* status);"

	^ self
		ffiCall:
			#(void TF_OperationGetAttrStringList #(TF_Operation * aTF_Operation , String nameZString , void * valueStringArray , Int64Array * sizesArray , int maxCount , void * aByteArray , size_t storageSize , TF_Status * status))
		module: TensorFlowCAPI