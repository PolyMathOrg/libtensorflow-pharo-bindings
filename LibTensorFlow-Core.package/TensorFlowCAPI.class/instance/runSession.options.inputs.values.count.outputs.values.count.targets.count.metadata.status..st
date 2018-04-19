session
runSession: aTF_Session
	options: opsTF_Buffer
	inputs: inTF_OutputArray values: inTF_TensorArray count: inCount
	outputs: outTF_OutputArray values: outTF_TensorArrayPtr count: outCount
	targets: aTF_OperationArray count: targetCount
	metadata: metaTF_Buffer
	status: aTF_Status
	
	"F_CAPI_EXPORT extern void TF_SessionRun(
    TF_Session* session,
    // RunOptions
    const TF_Buffer* run_options,
    // Input tensors
    const TF_Output* inputs, TF_Tensor* const* input_values, int ninputs,
    // Output tensors
    const TF_Output* outputs, TF_Tensor** output_values, int noutputs,
    // Target operations
    const TF_Operation* const* target_opers, int ntargets,
    // RunMetadata
    TF_Buffer* run_metadata,
    // Output status
TF_Status*);"
		
		^ self
		ffiCall: #(void TF_SessionRun #(TF_Session * aTF_Session, TF_Buffer * opsTF_Buffer, TF_OutputArray * inTF_OutputArray, TF_TensorPtrArray * inTF_TensorArray, int inCount, TF_OutputArray * outTF_OutputArray, TF_TensorPtrArray * outTF_TensorArrayPtr, int outCount, TF_OperationPtrArray * aTF_OperationArray, int targetCount, TF_Buffer * metaTF_Buffer, TF_Status * aTF_Status))
		module: TensorFlowCAPI