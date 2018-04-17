operation
operation: aTF_Operation attr: nameZString getInt64: valueLongPtr status: status
	"<cdecl: void 'TF_OperationGetAttrInt' (TF_Operation* char* ulonglong* TF_Status*)>"

	^ self
		ffiCall: #(void TF_OperationGetAttrInt #(TF_Operation * aTF_Operation , String nameZString , int64 * valueLongPtr , TF_Status * status))
		module: 'libtensorflow.dylib'