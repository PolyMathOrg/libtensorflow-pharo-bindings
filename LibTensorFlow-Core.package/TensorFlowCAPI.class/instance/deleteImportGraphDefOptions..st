options
deleteImportGraphDefOptions: aTF_ImportGraphDefOptions
	"<cdecl: void 'TF_DeleteImportGraphDefOptions' (TF_ImportGraphDefOptions*)>"

	^ self ffiCall: #(void TF_DeleteImportGraphDefOptions #(TF_ImportGraphDefOptions aTF_ImportGraphDefOptions)) module: 'libtensorflow.dylib'