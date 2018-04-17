operation
forGraph: aTF_Graph outputDims: aTF_Output status: aTF_Status
	"<cdecl: ulonglong 'TF_GraphGetTensorNumDims' (TF_Graph* TF_Output TF_Status*)>"

"Returns the number of dimensions of the Tensor referenced by `output`
in `graph`.

If the number of dimensions in the shape is unknown, returns -1.

Returns an error into `status` if:
   * `output` is not in `graph`."

	^ self
		ffiCall:
			#(int TF_GraphGetTensorNumDims #(TF_Graph * aTF_Graph , TF_Output aTF_Output , TF_Status * aTF_Status))
		module: 'libtensorflow.dylib'