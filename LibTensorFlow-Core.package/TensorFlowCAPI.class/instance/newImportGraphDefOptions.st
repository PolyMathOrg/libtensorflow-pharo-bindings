options
newImportGraphDefOptions
	"<cdecl: TF_ImportGraphDefOptions* 'TF_NewImportGraphDefOptions' (void)>"

	^ self ffiCall: #(TF_ImportGraphDefOptions * TF_NewImportGraphDefOptions #()) module: TensorFlowCAPI