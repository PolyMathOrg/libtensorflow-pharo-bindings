session
runSession: aTF_Session
	options: opsTF_Buffer
	inputs: inTF_OutputArray values: inTF_TensorArray count: inCount
	outputs: outTF_OutputArray values: outTF_TensorArrayPtr count: outCount
	targets: aTF_OperationArray count: targetCount
	metadata: metaTF_Buffer
	status: aTF_Status
	
	"<cdecl: void 'TF_SessionRun' (
		TF_Session*
		TF_Buffer*				RunOptions, may be nil
		TF_OutputArray*			inputs
		TF_TensorPtrArray*		inputs values
		long						inputs count
		TF_OutputArray*			outputs
		TF_TensorPtrArray*		outputs values (results)
		long						outputs count
		TF_OperationPtrArray*	target operations array, may be nil
		long						target operations count
		TF_Buffer*				RunMetadata
		TF_Status*)>"
		
		^ self
		ffiCall: #(void TF_SessionRun #(TF_Session aTF_Session, TF_Buffer opsTF_Buffer, TF_OutputArray inTF_OutputArray, TF_TensorPtrArray inTF_TensorArray, long inCount, TF_OutputArray outTF_OutputArray, TF_TensorPtrArray outTF_TensorArrayPtr, long outCount, TF_OperationPtrArray aTF_OperationArray, long targetCount, TF_Buffer metaTF_Buffer, TF_Status * aTF_Status))
		module: 'libtensorflow.dylib'