operation
operation: aTF_Operation attr: nameZString getBool: valueBoolPtr status: status
	"<cdecl: void 'TF_OperationGetAttrBool' (TF_Operation* char* ulonglong* TF_Status*)>"

	^ self
		ffiCall:
			#(void TF_OperationGetAttrBool #(TF_Operation * aTF_Operation , String nameZString , ulonglong * valueBoolPtr , TF_Status * status))
		module: 'libtensorflow.dylib'