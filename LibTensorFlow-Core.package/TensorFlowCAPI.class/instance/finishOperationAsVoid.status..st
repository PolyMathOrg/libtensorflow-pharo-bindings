operation description
finishOperationAsVoid: desc status: status
	"TF_CAPI_EXPORT extern TF_Operation* TF_FinishOperation(TF_OperationDescription* desc, TF_Status* status);"
"// If this function succeeds:
//   * *status is set to an OK value,
//   * a TF_Operation is added to the graph,
//   * a non-null value pointing to the added operation is returned --
//     this value is valid until the underlying graph is deleted.
// Otherwise:
//   * *status is set to a non-OK value,
//   * the graph is not modified,
//   * a null value is returned.
// In either case, it deletes `desc`."
	
	^ self
		ffiCall:
			#(TF_Operation * TF_FinishOperation #(TF_OperationDescription * desc , TF_Status * status))
		module: TensorFlowCAPI