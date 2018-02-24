operation
operation: aTF_Operation attr: nameZString getTensor: valueLongPtr status: status
	"<cdecl: void 'TF_OperationGetAttrTensor' (TF_Operation* char* void* TF_Status*)>"

	^ self
		ffiCall:
			#(void TF_OperationGetAttrTensor #(TF_Operation * aTF_Operation , String nameZString , TF_Status * status))
		module: 'libtensorflow.dylib'