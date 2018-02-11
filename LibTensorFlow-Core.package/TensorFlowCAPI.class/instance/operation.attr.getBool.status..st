operation
operation: aTF_Operation attr: nameZString getBool: valueBoolPtr status: status
	"<cdecl: void 'TF_OperationGetAttrBool' (TF_Operation* char* ulonglong* TF_Status*)>"
	^ self externalCallFailed

