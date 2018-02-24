operation
operation: aTF_Operation getMetadataFor: nameZString status: status
	"<cdecl: TF_AttrMetadata 'TF_OperationGetAttrMetadata' (TF_Operation* char* TF_Status*)>"

	^ self
		ffiCall:
			#(TF_AttrMetadata TF_OperationGetAttrMetadata #(TF_Operation * aTF_Operation , String nameZString , TF_Status * status))
		module: 'libtensorflow.dylib'