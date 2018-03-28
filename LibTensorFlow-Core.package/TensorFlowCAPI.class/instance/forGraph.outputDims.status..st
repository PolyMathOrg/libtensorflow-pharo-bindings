operation
forGraph: aTF_Graph outputDims: aTF_Output status: aTF_Status
	"<cdecl: ulonglong 'TF_GraphGetTensorNumDims' (TF_Graph* TF_Output TF_Status*)>"

	^ self
		ffiCall:
			#(int TF_GraphGetTensorNumDims #(TF_Graph * aTF_Graph , TF_Output aTF_Output , TF_Status * aTF_Status))
		module: 'libtensorflow.dylib'