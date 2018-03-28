operation
operation: aTF_Operation attr: nameZString getShape: int64array size: maxSize status: status
	"<cdecl: void 'TF_OperationGetAttrShape' (TF_Operation* char* Int64Array* ulonglong TF_Status*)>"

	^ self
		ffiCall: #(void TF_OperationGetAttrShape #(TF_Operation * aTF_Operation , String nameZString , Int64Array * int64array , ulonglong maxSize, TF_Status * status))
		module: 'libtensorflow.dylib'