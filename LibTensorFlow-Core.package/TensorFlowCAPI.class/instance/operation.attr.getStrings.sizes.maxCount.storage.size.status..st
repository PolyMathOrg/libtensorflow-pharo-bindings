operation
operation: aTF_Operation attr: nameZString getStrings: valueStringArray sizes: sizesArray maxCount: maxCount storage: aBytaArray size: storageSize status: status
	"<cdecl: void 'TF_OperationGetAttrStringList' (TF_Operation* char* void* Int64Array* ulonglong void* size_t TF_Status*)>"

	^ self
		ffiCall:
			#(void TF_OperationGetAttrStringList #(TF_Operation * aTF_Operation , String nameZString , void * valueStringArray , Int64Array * sizesArray , ulonglong maxCount , void * aByteArray , size_t storageSize , TF_Status * status))
		module: 'libtensorflow.dylib'