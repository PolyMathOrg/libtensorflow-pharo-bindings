operation
operation: aTF_Operation attr: nameZString getType: valueLongPtr status: status
	"<cdecl: void 'TF_OperationGetAttrType' (TF_Operation* char* ulonglong* TF_Status*)>"

	^ self
		ffiCall: #(void TF_OperationGetAttrType #(TF_Operation * aTF_Operation , String nameZString , ulonglong * valueLongPtr , TF_Status * status))
		module: TensorFlowCAPI