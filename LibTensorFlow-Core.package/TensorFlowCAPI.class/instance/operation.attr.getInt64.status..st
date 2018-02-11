operation
operation: aTF_Operation attr: nameZString getInt64: valueLongPtr status: status
	"<cdecl: void 'TF_OperationGetAttrInt' (TF_Operation* char* ulonglong* TF_Status*)>"
	^ self externalCallFailed

