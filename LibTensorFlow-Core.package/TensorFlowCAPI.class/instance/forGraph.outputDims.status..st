operation
forGraph: aTF_Graph outputDims: aTF_Output status: aTF_Status
	"<cdecl: ulonglong 'TF_GraphGetTensorNumDims' (TF_Graph* TF_Output TF_Status*)>"
	^ self externalCallFailed