Class {
	#name : #TensorFlowCAPI,
	#superclass : #FFILibrary,
	#classInstVars : [
		'current'
	],
	#category : 'LibTensorFlow-Core'
}

{ #category : #accessing }
TensorFlowCAPI class >> current [
	^ current ifNil: [ current := self uniqueInstance ]
]

{ #category : #examples }
TensorFlowCAPI class >> example1 [
	"Add two float numbers"

	| graph c1 c2 sum session result |
	graph := TF_Graph create.
	c1 := graph const: 'c1' value: 3.0 asTensor.
	c2 := graph const: 'c2' value: 4.0 asTensor.
	sum := c1 + c2.
	session := TF_Session on: graph.
	result := session runOutput: (sum output: 0).
	result asNumbers
]

{ #category : #examples }
TensorFlowCAPI class >> example2 [
	"Multiply two float matrices"

	| graph t1 t2 c1 c2 mult session result |
	graph := TF_Graph create.
	t1 := TF_Tensor fromFloats: #(#(1 2) #(3 4)).
	t2 := TF_Tensor fromFloats: #(#(5 6) #(7 8)).
	c1 := graph const: 'c1' value: t1.
	c2 := graph const: 'c2' value: t2.
	mult := c1 * c2.
	session := TF_Session on: graph.
	result := session runOutput: (mult output: 0).
	result asNumbers
]

{ #category : #examples }
TensorFlowCAPI class >> example3 [
	"Return a 3D tensor with 1 million elements filled with 0"

	| graph zeros session result |
	graph := TF_Graph create.
	zeros := graph zerosShaped: #(100 100 100).
	session := TF_Session on: graph.
	result := session runOutput: (zeros output: 0).
	result asNumbers
]

{ #category : #tensor }
TensorFlowCAPI >> allocateTensorType: anInteger shape: aLongLongArray rank: dimCount length: len [
	"TF_CAPI_EXPORT extern TF_Tensor* TF_AllocateTensor(TF_DataType,
                                                   const int64_t* dims, int num_dims, size_t len);"

	^ self
		ffiCall: #(
		TF_Tensor * TF_AllocateTensor #(
			int anInteger,
			int64 * aLongLongArray,
			int dimCount,
			size_t len))
		module: TensorFlowCAPI
]

{ #category : #session }
TensorFlowCAPI >> closeSession: aTF_Session status: aTF_Status [
	"TF_CAPI_EXPORT extern void TF_CloseSession(TF_Session*, TF_Status* status);"

	^ self ffiCall: #(void TF_CloseSession #(TF_Session * aTF_Session, TF_Status * aTF_Status)) module: TensorFlowCAPI
]

{ #category : #buffer }
TensorFlowCAPI >> deleteBuffer: aTF_Buffer [
	"<cdecl: void 'TF_DeleteBuffer' (TF_Buffer*)>"

	^ self
		ffiCall: #(void TF_DeleteBuffer #(TF_Buffer * aTF_Buffer))
		module: TensorFlowCAPI
]

{ #category : #graph }
TensorFlowCAPI >> deleteGraph: aTF_Graph [
	"<cdecl: void 'TF_DeleteGraph' (TF_Graph*)>"

	^ self ffiCall: #(void TF_DeleteGraph #(TF_Graph * aTF_Graph)) module: TensorFlowCAPI
]

{ #category : #options }
TensorFlowCAPI >> deleteImportGraphDefOptions: aTF_ImportGraphDefOptions [
	"<cdecl: void 'TF_DeleteImportGraphDefOptions' (TF_ImportGraphDefOptions*)>"

	^ self ffiCall: #(void TF_DeleteImportGraphDefOptions #(TF_ImportGraphDefOptions * aTF_ImportGraphDefOptions)) module: TensorFlowCAPI
]

{ #category : #session }
TensorFlowCAPI >> deleteSession: aTF_Session status: aTF_Status [
	"TF_CAPI_EXPORT extern void TF_DeleteSession(TF_Session*, TF_Status* status);"

	^ self
		ffiCall:
			#(void TF_DeleteSession #(TF_Session * aTF_Session , TF_Status * aTF_Status))
		module:
			TensorFlowCAPI
]

{ #category : #options }
TensorFlowCAPI >> deleteSessionOptions: aTF_SessionOptions [
	"<cdecl: void 'TF_DeleteSessionOptions' (TF_SessionOptions*)>"

	^ self ffiCall: #(void TF_DeleteSessionOptions #(TF_SessionOptions * aTF_SessionOptions)) module: TensorFlowCAPI
]

{ #category : #status }
TensorFlowCAPI >> deleteStatus: aTF_Status [
	"<cdecl: void 'TF_DeleteStatus' (TF_Status*)>"

	^ self ffiCall: #(void TF_DeleteStatus #(TF_Status * aTF_Status)) module: TensorFlowCAPI
]

{ #category : #tensor }
TensorFlowCAPI >> deleteTensor: aTF_Tensor [
	"<cdecl: void 'TF_DeleteTensor' (TF_Tensor*)>"

	^ self
		ffiCall: #(void TF_DeleteTensor #(TF_Tensor * aTF_Tensor))
		module: TensorFlowCAPI
]

{ #category : #'operation description' }
TensorFlowCAPI >> description: aTF_OperationDescription addControlInput: aTF_Output [
	"<cdecl: void 'TF_AddControlInput' (TF_OperationDescription* TF_Output)>"

	^ self
		ffiCall:
			#(void TF_AddControlInput #(TF_OperationDescription * aTF_OperationDescription , TF_Output aTF_Output))
		module: TensorFlowCAPI
]

{ #category : #'operation description' }
TensorFlowCAPI >> description: aTF_OperationDescription addInput: aTF_Output [
	"<cdecl: void 'TF_AddInput' (TF_OperationDescription* TF_Output)>"
	
	^ self
		ffiCall:
			#(void TF_AddInput #(TF_OperationDescription * aTF_OperationDescription , TF_Output aTF_Output))
		module: TensorFlowCAPI
]

{ #category : #'operation description' }
TensorFlowCAPI >> description: aTF_OperationDescription addInputs: aTF_OutputArray size: anInteger [
	"<TF_CAPI_EXPORT extern void TF_AddInputList(TF_OperationDescription* desc,
                                           const TF_Output* inputs, int num_inputs);>"

	^ self
		ffiCall:
			#(void TF_AddInputList #(TF_OperationDescription * aTF_OperationDescription , #TF_OutputArrayOld * aTF_OutputArray , int anInteger))
		module: TensorFlowCAPI
]

{ #category : #'operation description' }
TensorFlowCAPI >> description: desc set: attr_name toBool: value [
	"TF_CAPI_EXPORT extern void TF_SetAttrBool(TF_OperationDescription* desc,
                                          const char* attr_name, unsigned char value);"

	^ self
		ffiCall: #(void TF_SetAttrBool #(TF_OperationDescription * desc , String attr_name , bool value))
		module: TensorFlowCAPI
]

{ #category : #'operation description' }
TensorFlowCAPI >> description: aTF_OperationDescription set: aString toFloat: valueFloat [
	"TF_CAPI_EXPORT extern void TF_SetAttrFloat(TF_OperationDescription* desc, const char* attr_name, float value);"

	^ self
		ffiCall: #(void TF_SetAttrFloat #(TF_OperationDescription * aTF_OperationDescription , String aString , float valueFloat))
		module: TensorFlowCAPI
]

{ #category : #'operation description' }
TensorFlowCAPI >> description: desc set: attr_name toInt64: value [
	"TF_CAPI_EXPORT extern void TF_SetAttrInt(TF_OperationDescription* desc, const char* attr_name, int64_t value);"

	^ self
		ffiCall: #(void TF_SetAttrInt #(TF_OperationDescription * desc , String attr_name , int64 value))
		module: TensorFlowCAPI
]

{ #category : #'operation description' }
TensorFlowCAPI >> description: aTF_OperationDescription set: aString toShape: anInt64Array size: size [
	"TF_CAPI_EXPORT extern void TF_SetAttrShape(TF_OperationDescription* desc,
                                           const char* attr_name, const int64_t* dims, int num_dims);"
	
	
	^ self ffiCall: #(void TF_SetAttrShape #(TF_OperationDescription * aTF_OperationDescription, String aString, int64 * anInt64Array, int size)) module: TensorFlowCAPI
]

{ #category : #'operation description' }
TensorFlowCAPI >> description: desc set: attr_name toString: value size: size [
	"TF_CAPI_EXPORT extern void TF_SetAttrString(TF_OperationDescription* desc,
                                            const char* attr_name, const void* value, size_t length);"

	^ self
		ffiCall:
			#(void TF_SetAttrString #(TF_OperationDescription * desc , String attr_name , String value , size_t size))
		module: TensorFlowCAPI
]

{ #category : #'operation description' }
TensorFlowCAPI >> description: aTF_OperationDescription set: aString toStrings: anArrayOfString sizes: sizes count: count [
	"TF_CAPI_EXPORT extern void TF_SetAttrStringList(TF_OperationDescription* desc,
                                                const char* attr_name,
                                                const void* const* values,
                                                const size_t* lengths,
															  int num_values);"

	^ self
		ffiCall:
			#(void TF_SetAttrStringList #(TF_OperationDescription * aTF_OperationDescription , String aString , void * anArrayOfString , int64 * sizes , int count))
		module: TensorFlowCAPI
]

{ #category : #'operation description' }
TensorFlowCAPI >> description: aTF_OperationDescription set: aString toTensor: aTF_Tensor status: aTF_Status [
	"<cdecl: void 'TF_SetAttrTensor' (TF_OperationDescription* char* TF_Tensor* TF_Status*)>"
	^ self
		ffiCall:
			#(void TF_SetAttrTensor #(TF_OperationDescription * aTF_OperationDescription , String aString , TF_Tensor * aTF_Tensor, TF_Status * aTF_Status))
		module: TensorFlowCAPI
]

{ #category : #'operation description' }
TensorFlowCAPI >> description: aTF_OperationDescription set: aString toType: anInt [
	"TF_CAPI_EXPORT extern void TF_SetAttrType(TF_OperationDescription* desc,
                                          const char* attr_name, TF_DataType value);"

	^ self
		ffiCall:
			#(void TF_SetAttrType #(TF_OperationDescription * aTF_OperationDescription , String aString , int anInt))
		module: TensorFlowCAPI
]

{ #category : #'operation description' }
TensorFlowCAPI >> description: aTF_OperationDescription setDevice: aString [
	"<cdecl: void 'TF_SetDevice' (TF_OperationDescription* char*)>"

	^ self
		ffiCall:
			#(void TF_SetDevice #(TF_OperationDescription * aTF_OperationDescription , String aString))
		module: TensorFlowCAPI
]

{ #category : #utils }
TensorFlowCAPI >> externalizeString: aString [
	| answer |
	answer := ExternalAddress allocate: aString size + 1.
	answer byteAt: aString size + 1 put: 0.
	aString withIndexDo: [:char :index |
		answer byteAt:  index put: char asciiValue].
	^ answer
]

{ #category : #'operation description' }
TensorFlowCAPI >> finishOperation: aTF_OperationDescription status: aTF_Status [
	| answer |
	
	answer := self finishOperationAsVoid: aTF_OperationDescription status: aTF_Status.
	aTF_OperationDescription handle: nil.
	"answer handle: answer getHandle getHandle."
	^answer
]

{ #category : #'operation description' }
TensorFlowCAPI >> finishOperationAsVoid: desc status: status [
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
]

{ #category : #operation }
TensorFlowCAPI >> forGraph: aTF_Graph outputDims: aTF_Output status: aTF_Status [
	"<cdecl: ulonglong 'TF_GraphGetTensorNumDims' (TF_Graph* TF_Output TF_Status*)>"

"Returns the number of dimensions of the Tensor referenced by `output`
in `graph`.

If the number of dimensions in the shape is unknown, returns -1.

Returns an error into `status` if:
   * `output` is not in `graph`."

	^ self
		ffiCall:
			#(int TF_GraphGetTensorNumDims #(TF_Graph * aTF_Graph , TF_Output aTF_Output , TF_Status * aTF_Status))
		module: TensorFlowCAPI
]

{ #category : #utils }
TensorFlowCAPI >> getAllOps [
	"<cdecl: TF_Buffer* 'TF_GetAllOpList' (void)>"

	^ self ffiCall: #(TF_Buffer * TF_GetAllOpList #()) module: TensorFlowCAPI
]

{ #category : #status }
TensorFlowCAPI >> getCode: aTF_Status [
	"<cdecl: ulong 'TF_GetCode' (TF_Status*)>"

	^ self ffiCall: #(ulong TF_GetCode #(TF_Status * aTF_Status)) module: TensorFlowCAPI
]

{ #category : #graph }
TensorFlowCAPI >> getGraphVersionsOf: aTF_Graph buffer: aTF_Buffer status: aTF_Status [
	"// Returns the serialized VersionDef proto for this graph.
TF_CAPI_EXPORT extern void TF_GraphVersions(TF_Graph* graph,
                                            TF_Buffer* output_version_def, TF_Status* status);"

	^ self ffiCall: #(void TF_GraphVersions #(TF_Graph * aTF_Graph , TF_Buffer * aTF_Buffer , TF_Status * aTF_Status)) module: TensorFlowCAPI
]

{ #category : #graph }
TensorFlowCAPI >> graph: aTF_Graph getOperationNamed: aString [
	| answer |
	answer := self graph: aTF_Graph getOperationNamedAsVoid: aString.
	answer := TF_Operation fromHandle: answer getHandle.
	answer graph: aTF_Graph.
	^ answer
]

{ #category : #graph }
TensorFlowCAPI >> graph: aTF_Graph getOperationNamedAsVoid: aString [
	"<cdecl: void* 'TF_GraphOperationByName' (TF_Graph* char*)>"


	^ self ffiCall: #(void * TF_GraphOperationByName #(TF_Graph * aTF_Graph, String aString)) module: TensorFlowCAPI
]

{ #category : #graph }
TensorFlowCAPI >> graph: aTF_Graph getRankOf: aTF_OutputOrInput status: status [
	"<cdecl: ulonglong 'TF_GraphGetTensorNumDims' (TF_Graph* TF_Output TF_Status*)>"

	^ self ffiCall: #(int TF_GraphGetTensorNumDims #(TF_Graph * aTF_Graph, TF_Output aTF_OutputOrInput, TF_Status * status)) module: TensorFlowCAPI
]

{ #category : #graph }
TensorFlowCAPI >> graph: aTF_Graph getShapeOf: aTF_OutputOrInput into: anInt64Array size: anInteger status: status [
	"TF_CAPI_EXPORT extern void TF_GraphGetTensorShape(TF_Graph* graph,
                                                  TF_Output output,
                                                  int64_t* dims, int num_dims,
																TF_Status* status);"
	
^ self ffiCall: #(void TF_GraphGetTensorShape #(TF_Graph * aTF_Graph, TF_Output aTF_OutputOrInput, int64 * anInt64Array, int anInteger, TF_Status * status)) module: TensorFlowCAPI
]

{ #category : #operation }
TensorFlowCAPI >> graph: aTF_Graph operationAt: contextULongLongPtr [
	| answer |
	answer := self graph: aTF_Graph operationAtAsVoid: contextULongLongPtr.
	answer handle: answer getHandle getHandle.
	answer graph: aTF_Graph.
	^ answer
]

{ #category : #operation }
TensorFlowCAPI >> graph: aTF_Graph operationAtAsVoid: contextULongLongPtr [
	"TF_CAPI_EXPORT extern TF_Operation* TF_GraphNextOperation(TF_Graph* graph, size_t* pos);"

	^ self ffiCall: #(TF_Operation * TF_GraphNextOperation #(TF_Graph * aTF_Graph, size_t * contextULongLongPtr)) module: TensorFlowCAPI
]

{ #category : #graph }
TensorFlowCAPI >> graph: aTF_Graph setShapeOf: aTF_OutputOrInput to: anInt64Array size: anInteger status: status [
	"<cdecl: void 'TF_GraphSetTensorShape' (TF_Graph* TF_Output Int64Array* ulonglong TF_Status*)>"

^ self ffiCall: #(void TF_GraphSetTensorShape #(TF_Graph * aTF_Graph, TF_Output aTF_OutputOrInput, int64 * anInt64Array, int anInteger, TF_Status * status)) module: TensorFlowCAPI
]

{ #category : #graph }
TensorFlowCAPI >> graph: aTF_Graph toGraphDef: aTF_Buffer status: aTF_Status [
	"<cdecl: void 'TF_GraphToGraphDef' (TF_Graph* TF_Buffer* TF_Status*)>"

	^ self
		ffiCall: #(void TF_GraphToGraphDef #(TF_Graph * aTF_Graph , TF_Buffer * aTF_Buffer , TF_Status * aTF_Status))
		module: TensorFlowCAPI
]

{ #category : #graph }
TensorFlowCAPI >> importGraphDefInto: aTF_Graph from: aTF_Buffer options: aTF_ImportGraphDefOptions status: aTF_Status [
	"<cdecl: void 'TF_GraphImportGraphDef' (TF_Graph* TF_Buffer* TF_ImportGraphDefOptions* TF_Status*)>"

	^ self ffiCall: #(void TF_GraphImportGraphDef #(TF_Graph * aTF_Graph, TF_Buffer * aTF_Buffer, TF_ImportGraphDefOptions * aTF_ImportGraphDefOptions, TF_Status * aTF_Status)) module: TensorFlowCAPI
]

{ #category : #'accessing platform' }
TensorFlowCAPI >> macModuleName [
	^ '/usr/local/Cellar/libtensorflow/1.14.0/lib/libtensorflow.so'
]

{ #category : #status }
TensorFlowCAPI >> message: aTF_Status [
	"<cdecl: char* 'TF_Message' (TF_Status*)>"

	^ self ffiCall: #(String TF_Message #(TF_Status * aTF_Status)) module: TensorFlowCAPI 
]

{ #category : #buffer }
TensorFlowCAPI >> newBufferFromString: aString size: anInteger [
	"<cdecl: TF_Buffer* 'TF_NewBufferFromString' (char* size_t)>"

	^ self
		ffiCall: #(TF_Buffer * TF_NewBufferFromString #(String aString , size_t anInteger))
		module: TensorFlowCAPI
]

{ #category : #'instance creation' }
TensorFlowCAPI >> newGraph [
	| answer |
	answer := self newGraphAsVoid.
	answer := TF_Graph fromHandle: answer getHandle.
	^ answer
]

{ #category : #'instance creation' }
TensorFlowCAPI >> newGraphAsVoid [
	"F_CAPI_EXPORT extern TF_Graph* TF_NewGraph();"

	^ self ffiCall: #(TF_Graph * TF_NewGraph #()) module: TensorFlowCAPI
]

{ #category : #options }
TensorFlowCAPI >> newImportGraphDefOptions [
	"<cdecl: TF_ImportGraphDefOptions* 'TF_NewImportGraphDefOptions' (void)>"

	^ self ffiCall: #(TF_ImportGraphDefOptions * TF_NewImportGraphDefOptions #()) module: TensorFlowCAPI
]

{ #category : #operation }
TensorFlowCAPI >> newOperationDescriptionOn: graph type: type named: aName [
	"<cdecl: TF_OperationDescription* 'TF_NewOperation' (TF_Graph* char* char*)>"

	^ self
		ffiCall:
			#(TF_OperationDescription * TF_NewOperation #(TF_Graph * graph , String type , String aName))
		module: TensorFlowCAPI
]

{ #category : #session }
TensorFlowCAPI >> newSession: aTF_Graph options: aTF_SessionOptions status: aTF_Status [
	"<cdecl: TF_Session* 'TF_NewSession' (TF_Graph* TF_SessionOptions* TF_Status*)>"

	^ self
		ffiCall: #(TF_Session * TF_NewSession #(TF_Graph * aTF_Graph, TF_SessionOptions * aTF_SessionOptions, TF_Status * aTF_Status))
		module: TensorFlowCAPI
]

{ #category : #options }
TensorFlowCAPI >> newSessionOptions [
	"<cdecl: TF_SessionOptions* 'TF_NewSessionOptions' (void)>"

	^ self ffiCall: #(TF_SessionOptions * TF_NewSessionOptions #()) module: TensorFlowCAPI
]

{ #category : #status }
TensorFlowCAPI >> newStatus [
	"<cdecl: TF_Status* 'TF_NewStatus' (void)>"

	^ self ffiCall: #(TF_Status * TF_NewStatus #()) module: TensorFlowCAPI
]

{ #category : #tensor }
TensorFlowCAPI >> newTensorType: anInteger shape: aLongLongArray rank: dimCount data: aData length: len deallocator: deallocator args: args [
	"TF_CAPI_EXPORT extern TF_Tensor* TF_NewTensor(
    	TF_DataType, const int64_t* dims, int num_dims, void* data, size_t len,
    	void (*deallocator)(void* data, size_t len, void* arg),
    	void* deallocator_arg);"

	^ self
		ffiCall: #(
		TF_Tensor * TF_NewTensor #(
			int anInteger,
			int64 * aLongLongArray,
			int dimCount,
			void* aData,
			size_t len,
			void* deallocator,
			void* args
			))
		module: TensorFlowCAPI
]

{ #category : #operation }
TensorFlowCAPI >> operation: aTF_Operation attr: nameZString getBool: valueBoolPtr status: status [
	"<cdecl: void 'TF_OperationGetAttrBool' (TF_Operation* char* ulonglong* TF_Status*)>"

	^ self
		ffiCall:
			#(void TF_OperationGetAttrBool #(TF_Operation * aTF_Operation , String nameZString , ulonglong * valueBoolPtr , TF_Status * status))
		module: TensorFlowCAPI
]

{ #category : #operation }
TensorFlowCAPI >> operation: aTF_Operation attr: nameZString getFloat: valueFloatPtr status: status [
	"<cdecl: void 'TF_OperationGetAttrFloat' (TF_Operation* char* float* TF_Status*)>"

	^ self
		ffiCall:
			#(void TF_OperationGetAttrFloat #(TF_Operation * aTF_Operation , String nameZString , float * valueFloatPtr , TF_Status * status))
		module: TensorFlowCAPI
]

{ #category : #operation }
TensorFlowCAPI >> operation: aTF_Operation attr: nameZString getInt64: valueLongPtr status: status [
	"TF_CAPI_EXPORT extern void TF_OperationGetAttrInt(TF_Operation* oper,
                                                  const char* attr_name,
                                                  int64_t* value, TF_Status* status);"

	^ self
		ffiCall: #(void TF_OperationGetAttrInt #(TF_Operation * aTF_Operation , String nameZString , int64 * valueLongPtr , TF_Status * status))
		module: TensorFlowCAPI
]

{ #category : #operation }
TensorFlowCAPI >> operation: aTF_Operation attr: nameZString getShape: int64array size: maxSize status: status [
	"TF_CAPI_EXPORT extern void TF_OperationGetAttrShape(TF_Operation* oper,
                                                    const char* attr_name,
                                                    int64_t* value,
                                                    int num_dims, TF_Status* status);"

	^ self
		ffiCall: #(void TF_OperationGetAttrShape #(TF_Operation * aTF_Operation , String nameZString , int64 * int64array , int maxSize, TF_Status * status))
		module: TensorFlowCAPI
]

{ #category : #operation }
TensorFlowCAPI >> operation: aTF_Operation attr: nameZString getString: valueString size: maxSize status: status [
	"TF_CAPI_EXPORT extern void TF_OperationGetAttrString(TF_Operation* oper,
                                                     const char* attr_name,
                                                     void* value,
                                                     size_t max_length,
																	TF_Status* status);"

	^ self
		ffiCall: #(void TF_OperationGetAttrString #(TF_Operation * aTF_Operation , String nameZString , void * valueString , size_t maxSize , TF_Status * status))
		module: TensorFlowCAPI
]

{ #category : #operation }
TensorFlowCAPI >> operation: aTF_Operation attr: nameZString getStrings: valueStringArray sizes: sizesArray maxCount: maxCount storage: aBytaArray size: storageSize status: status [
	"TF_CAPI_EXPORT extern void TF_OperationGetAttrStringList(
    TF_Operation* oper, const char* attr_name, void** values, size_t* lengths,
int max_values, void* storage, size_t storage_size, TF_Status* status);"

	^ self
		ffiCall:
			#(void TF_OperationGetAttrStringList #(TF_Operation * aTF_Operation , String nameZString , void * valueStringArray , int64 * sizesArray , int maxCount , void * aByteArray , size_t storageSize , TF_Status * status))
		module: TensorFlowCAPI
]

{ #category : #operation }
TensorFlowCAPI >> operation: aTF_Operation attr: nameZString getTensor: valueLongPtr status: status [
	"<cdecl: void 'TF_OperationGetAttrTensor' (TF_Operation* char* void* TF_Status*)>"

	^ self
		ffiCall:
			#(void TF_OperationGetAttrTensor #(TF_Operation * aTF_Operation , String nameZString , void * valueLongPtr, TF_Status * status))
		module: TensorFlowCAPI
]

{ #category : #operation }
TensorFlowCAPI >> operation: aTF_Operation attr: nameZString getType: valueLongPtr status: status [
	"<cdecl: void 'TF_OperationGetAttrType' (TF_Operation* char* ulonglong* TF_Status*)>"

	^ self
		ffiCall: #(void TF_OperationGetAttrType #(TF_Operation * aTF_Operation , String nameZString , ulonglong * valueLongPtr , TF_Status * status))
		module: TensorFlowCAPI
]

{ #category : #operation }
TensorFlowCAPI >> operation: aTF_Operation getMetadataFor: nameZString status: status [
	"<cdecl: TF_AttrMetadata 'TF_OperationGetAttrMetadata' (TF_Operation* char* TF_Status*)>"

	^ self
		ffiCall:
			#(TF_AttrMetadata TF_OperationGetAttrMetadata #(TF_Operation * aTF_Operation , String nameZString , TF_Status * status))
		module: TensorFlowCAPI
]

{ #category : #operation }
TensorFlowCAPI >> operationDevice: aTF_Operation [
	"<cdecl: char* 'TF_OperationDevice' (TF_Operation*)>"

	^ self ffiCall: #(String TF_OperationDevice #(TF_Operation * aTF_Operation)) module: TensorFlowCAPI
]

{ #category : #operation }
TensorFlowCAPI >> operationInput: aTF_Input [
	"TF_CAPI_EXPORT extern TF_Output TF_OperationInput(TF_Input oper_in);"

	^ self ffiCall: #(TF_Output TF_OperationInput #(TF_Input aTF_Input)) module: TensorFlowCAPI
]

{ #category : #operation }
TensorFlowCAPI >> operationName: aTF_Operation [
	"<cdecl: char* 'TF_OperationName' (TF_Operation*)>"

	^ self ffiCall: #(String TF_OperationName #(TF_Operation * aTF_Operation)) module: TensorFlowCAPI
]

{ #category : #operation }
TensorFlowCAPI >> operationNumInputs: aTF_Operation [
	"TF_CAPI_EXPORT extern int TF_OperationNumInputs(TF_Operation* oper);"

	^ self
		ffiCall: #(int TF_OperationNumInputs #(TF_Operation * aTF_Operation))
		module: TensorFlowCAPI
]

{ #category : #operation }
TensorFlowCAPI >> operationNumOutputs: aTF_Operation [
	"TF_CAPI_EXPORT extern int TF_OperationNumOutputs(TF_Operation* oper)"

	^ self
		ffiCall: #(int TF_OperationNumOutputs #(TF_Operation * aTF_Operation))
		module: TensorFlowCAPI
]

{ #category : #operation }
TensorFlowCAPI >> operationOpType: aTF_Operation [
	"<cdecl: char* 'TF_OperationOpType' (TF_Operation*)>"

	^ self ffiCall: #(String TF_OperationOpType #(TF_Operation * aTF_Operation)) module: TensorFlowCAPI 
]

{ #category : #operation }
TensorFlowCAPI >> operationOutputType: aTF_Output [
	"<cdecl: TF_DataType 'TF_OperationOutputType' (TF_Output)>"

	^ self
		ffiCall: #(int TF_OperationOutputType #(TF_Output aTF_Output))
		module: TensorFlowCAPI
]

{ #category : #strings }
TensorFlowCAPI >> primStringEncodedSize: anInteger [
	"TF_CAPI_EXPORT extern size_t TF_StringEncodedSize(size_t len)"

	^ self ffiCall: #(size_t TF_StringEncodedSize #(size_t anInteger)) module: TensorFlowCAPI
]

{ #category : #session }
TensorFlowCAPI >> runSession: aTF_Session options: opsTF_Buffer inputs: inTF_OutputArray values: inTF_TensorArray count: inCount outputs: outTF_OutputArray values: outTF_TensorArrayPtr count: outCount targets: aTF_OperationArray count: targetCount metadata: metaTF_Buffer status: aTF_Status [
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
		ffiCall:
			#(void TF_SessionRun #(TF_Session * aTF_Session , TF_Buffer * opsTF_Buffer , void * inTF_OutputArray , void * inTF_TensorArray , int inCount , void * outTF_OutputArray , void * outTF_TensorArrayPtr , int outCount , void * aTF_OperationArray , int targetCount , TF_Buffer * metaTF_Buffer , TF_Status * aTF_Status))
		module:
			TensorFlowCAPI
]

{ #category : #options }
TensorFlowCAPI >> sessionOptions: aTF_SessionOptions setConfig: aString configSize: anInteger status: aTF_Status [
	" not sure how to use this. Best information found in http://devdocs.io/tensorflow~python/contrib.learn#RunConfig"

	"<TF_CAPI_EXPORT extern void TF_SetConfig(TF_SessionOptions* options,
                                        const void* proto, size_t proto_len,
													TF_Status* status);>"

	^ self
		ffiCall: #(void TF_SetConfig #(TF_SessionOptions * aTF_SessionOptions , String aString , size_t anInteger , TF_Status * aTF_Status))
		module: TensorFlowCAPI
]

{ #category : #options }
TensorFlowCAPI >> sessionOptions: aTF_SessionOptions setTarget: aString [
	"<cdecl: void 'TF_SetTarget' (TF_SessionOptions* char*)>"

	^ self
		ffiCall: #(void TF_SetTarget #(TF_SessionOptions * aTF_SessionOptions , String aString))
		module: TensorFlowCAPI
]

{ #category : #status }
TensorFlowCAPI >> setStatus: aTF_Status code: anInteger message: anExternalString [
	"TF_CAPI_EXPORT extern void TF_SetStatus(TF_Status* s, TF_Code code, const char* msg);"

	^ self ffiCall: #(void TF_SetStatus #(TF_Status * aTF_Status , ulong anInteger , String anExternalString)) module: TensorFlowCAPI
]

{ #category : #strings }
TensorFlowCAPI >> stringDecode: src [
	| destination status answer dstSize |
	destination := ByteArray new: 8.
	dstSize := ByteArray new: 8.
	status := TF_Status create.
	answer := self stringDecode: src len: src size destination: destination len: dstSize status: status.
	status check.
	dstSize := dstSize unsignedLongLongAt: 1.
	destination := destination pointerAt: 1.
	answer := (destination structAt: 1 length: dstSize) asString.
	^ answer
]

{ #category : #strings }
TensorFlowCAPI >> stringDecode: srcString len: srcLen destination: dstPointer len: dstLenPointer status: status [
	"TF_CAPI_EXPORT extern size_t TF_StringDecode(const char* src, size_t src_len,
                                             const char** dst, size_t* dst_len,
TF_Status* status);"

	^ self
		ffiCall:
			#(size_t TF_StringDecode #(String srcString , size_t srcLen , String dstPointer , size_t * dstLenPointer, TF_Status * status))
		module: TensorFlowCAPI
]

{ #category : #strings }
TensorFlowCAPI >> stringEncode: srcString len: srcLen destination: dstString len: dstLen status: status [
	"TF_CAPI_EXPORT extern size_t TF_StringEncode(const char* src, size_t src_len,
                                             char* dst, size_t dst_len,
													TF_Status* status);"

	^ self
		ffiCall:
			#(size_t TF_StringEncode #(String srcString , size_t srcLen , String dstString , size_t dstLen, TF_Status * status))
		module: TensorFlowCAPI
]

{ #category : #strings }
TensorFlowCAPI >> stringEncode: src to: dst [
	^ self stringEncode: src to: dst size: dst size
]

{ #category : #strings }
TensorFlowCAPI >> stringEncode: src to: dst size: dstSize [
	| status answer |
	status := TF_Status create.
	answer := self
		stringEncode: src
		len: src size
		destination: dst
		len: dstSize
		status: status.
	status check.
	^ answer
]

{ #category : #strings }
TensorFlowCAPI >> stringEncodedSize: aString [
	^ self primStringEncodedSize: aString size
]

{ #category : #tensor }
TensorFlowCAPI >> tensor: aTF_Tensor sizeOn: dimension [
	"TF_CAPI_EXPORT extern int64_t TF_Dim(const TF_Tensor* tensor, int dim_index);"
	
	^ self
		ffiCall: #(int64 TF_Dim #(TF_Tensor * aTF_Tensor , int dimension))
		module: TensorFlowCAPI
]

{ #category : #tensor }
TensorFlowCAPI >> tensorByteSize: aTF_Tensor [
	"TF_CAPI_EXPORT extern size_t TF_TensorByteSize(const TF_Tensor*);"

	^ self ffiCall: #(size_t TF_TensorByteSize #(TF_Tensor * aTF_Tensor)) module: TensorFlowCAPI
]

{ #category : #tensor }
TensorFlowCAPI >> tensorData: aTF_Tensor [
	"TF_CAPI_EXPORT extern void* TF_TensorData(const TF_Tensor*)"

	^ self
		ffiCall: #(void * TF_TensorData #(TF_Tensor * aTF_Tensor))
		module: TensorFlowCAPI
]

{ #category : #tensor }
TensorFlowCAPI >> tensorRank: aTF_Tensor [
	"<cdecl: longlong 'TF_NumDims' (TF_Tensor*)>"

	^ self
		ffiCall: #(int TF_NumDims #(TF_Tensor * aTF_Tensor))
		module: TensorFlowCAPI
]

{ #category : #tensor }
TensorFlowCAPI >> tensorType: aTF_Tensor [
	"<cdecl: ulonglong 'TF_TensorType' (TF_Tensor*)>"
^ self
		ffiCall: #(ulonglong TF_TensorType #(TF_Tensor * aTF_Tensor))
		module: TensorFlowCAPI
]

{ #category : #'accessing platform' }
TensorFlowCAPI >> unixModuleName [
	^ '/usr/local/lib/libtensorflow.so'
]

{ #category : #utils }
TensorFlowCAPI >> version [
	"TF_Version returns a string describing version information of the
	TensorFlow library. TensorFlow using semantic versioning."

	"TF_CAPI_EXPORT extern const char* TF_Version();"


	^ self ffiCall: #(String TF_Version #()) module: TensorFlowCAPI
]
