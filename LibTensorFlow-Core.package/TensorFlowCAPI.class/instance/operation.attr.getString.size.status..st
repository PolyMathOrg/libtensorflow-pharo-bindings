operation
operation: aTF_Operation attr: nameZString getString: valueString size: maxSize status: status
	"<cdecl: void 'TF_OperationGetAttrString' (TF_Operation* char* void* ulonglong TF_Status*)>"

	^ self
		ffiCall: #(void TF_OperationGetAttrString #(TF_Operation * aTF_Operation , String nameZString , void * valueString , size_t maxSize , TF_Status * status))
		module: 'libtensorflow.dylib'