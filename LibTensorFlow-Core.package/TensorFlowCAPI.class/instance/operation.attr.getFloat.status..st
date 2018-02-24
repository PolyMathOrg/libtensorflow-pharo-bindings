operation
operation: aTF_Operation attr: nameZString getFloat: valueFloatPtr status: status
	"<cdecl: void 'TF_OperationGetAttrFloat' (TF_Operation* char* float* TF_Status*)>"

	^ self
		ffiCall:
			#(void TF_OperationGetAttrFloat #(TF_Operation * aTF_Operation , String nameZString , float * valueFloatPtr , TF_Status * status))
		module: 'libtensorflow.dylib'