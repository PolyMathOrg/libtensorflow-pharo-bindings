"
A TensorFlow computation, represented as a dataflow graph.

A Graph contains a set of Operation objects, which represent units of computation; and Tensor objects, which represent the units of data that flow between operations.
"
Class {
	#name : #'TF_Graph',
	#superclass : #FFIOpaqueObject,
	#instVars : [
		'context'
	],
	#category : 'LibTensorFlow-Core'
}

{ #category : #'instance creation' }
TF_Graph class >> create [
	^ TensorFlowCAPI current newGraph initialize autoRelease
]

{ #category : #'instance creation' }
TF_Graph class >> finalizeResourceData: handle [
	handle isNull ifTrue: [ ^ self ].
	(TensorFlowCAPI current) deleteGraph: handle
	
]

{ #category : #'instance creation' }
TF_Graph class >> fromBlock: aBlockClosure [
	| output graph |
	graph := self create.
	output := graph fromBlock: aBlockClosure.
	output alias: 'output'.
	^ graph
]

{ #category : #'instance creation' }
TF_Graph class >> fromFileNamed: aString [
	^ self create importFileNamed: aString
]

{ #category : #'instance creation' }
TF_Graph class >> fromString: aString [
	^ self create importString: aString
]

{ #category : #operations }
TF_Graph >> add: nameString described: aBlock [
	^ self newOperation: 'Add' named: nameString described: aBlock
]

{ #category : #accessing }
TF_Graph >> allInitializers [
	^ self operationsSelect: [ :op | op type = 'Assign' and: [ op name endsWith: '_initializer' ] ]
]

{ #category : #accessing }
TF_Graph >> allInputs [
	^ self operationsSelect: [ :op | op type = 'Placeholder' ]
]

{ #category : #accessing }
TF_Graph >> allOperations [
	^ self operationsSelect: [ :op | true ]
]

{ #category : #accessing }
TF_Graph >> allVariables [
	^ self operationsSelect: [ :op | op type = 'Variable' ]
]

{ #category : #gtInspector }
TF_Graph >> asRoassalView [
	^ self drawOnRoassalView: RTView new
]

{ #category : #operations }
TF_Graph >> asString: nameString described: aBlock [
	^ self newOperation: 'AsString' named: nameString described: aBlock
]

{ #category : #operations }
TF_Graph >> concat: nameString described: aBlock [
	^ self newOperation: 'Concat' named: nameString described: aBlock
]

{ #category : #'root operations' }
TF_Graph >> const: aTF_Tensor [
	| name |
	name := self nameFor: 'constant'.
	^ self const: name value: aTF_Tensor
]

{ #category : #'root operations' }
TF_Graph >> const: nameString value: aTF_Tensor [
	^ self
		newOperation: 'Const'
		named: nameString
		described: [ :description | 
			description at: 'dtype' putType: aTF_Tensor type.
			description at: 'value' putTensor: aTF_Tensor ]
]

{ #category : #accessing }
TF_Graph >> definition [
"Return the protobuff serialisation of the graph"
	| buffer status |
	status := TF_Status create.
	buffer := TF_Buffer new.
	self library graph: self toGraphDef: buffer status: status.
	status check.
	^ buffer dataBytes asString
]

{ #category : #'initialize-release' }
TF_Graph >> delete [
"deprecated"
self halt.
	self ignoreFinalization.
	self isNull
		ifFalse: [ self library deleteGraph: self ].
	handle := nil
]

{ #category : #gtInspector }
TF_Graph >> drawOnRoassalView: view [
	| operations lab nodes edges |
	
	operations := self allOperations.
	lab := RTLabel new.
	nodes := (RTEllipse new
				size: 15;
				color: (Color blue alpha: 0.4)) + (lab text: [ :op | op name ]) elementsOn: operations.
	nodes @ RTDraggable.
	view @ RTDraggableView @RTZoomableView.
	
	view addAll:nodes.

	edges := OrderedCollection new.
	operations
				do: [ :op | 
					| nbInputs output op1 op2 |
					nbInputs := op inputsCount.
					0 to: nbInputs - 1 do: [ :index | 
						output := TensorFlowCAPI uniqueInstance operationInput: (op input: index).
						op1 := TF_Operation fromHandle: output operation.
						op2 := (operations select: [ :opx | opx name = op1 name ]) at: 1.
						edges add: op2 -> op ] ].
	RTEdgeBuilder new
				view: view;
				shape:
					(RTArrowedLine new
						color: Color black);
				source: edges connectFrom: #key to: #value.
	(RTLayoutBuilder new forceWithCharge: -600) on: view elements.

	^ view
]

{ #category : #finalization }
TF_Graph >> finalize [
"deprecated"
"No more used in Pharo 6.1 ?"
	self halt.
	self delete
]

{ #category : #'initialize-release' }
TF_Graph >> fromBlock: aBlockClosure [
	"Create operations from a block"

	| types |
	types := Array new: aBlockClosure argumentCount.
	types atAllPut: TF_Tensor typeFloat.
	^ self fromBlock: aBlockClosure inputTypes: types
]

{ #category : #'initialize-release' }
TF_Graph >> fromBlock: aBlockClosure inputTypes: anArray [
	| inputs index |
	index := 0.
	inputs := (1 to: aBlockClosure argumentCount) collect: [:each |
		index := index + 1.
		self inputType: (anArray at: index)].
	^ aBlockClosure valueWithArguments: inputs.

]

{ #category : #'initialize-release' }
TF_Graph >> fromBlock: aBlockClosure inputTypes: anArray named: nameString [
	| previousContext answer |
	previousContext := context.
	context := context, nameString, '/'.
	answer := self fromBlock: aBlockClosure inputTypes: anArray.
	context := previousContext.
	^ answer
]

{ #category : #'initialize-release' }
TF_Graph >> fromBlock: aBlockClosure named: nameString [
	| types |
	types := Array new: aBlockClosure argumentCount.
	types atAllPut: TF_Tensor typeFloat.
	^ self fromBlock: aBlockClosure inputTypes: types named: nameString
]

{ #category : #gtInspector }
TF_Graph >> gtInspectorGraphIn: composite [
	<gtInspectorPresentationOrder: 30>
	composite roassal2
		title: 'DataFlow';
		painting: [ :view | 
			self drawOnRoassalView: view.
			view ]
]

{ #category : #'initialize-release' }
TF_Graph >> import: aTF_Buffer [
	| options status |
	status := TF_Status create.
	options := TF_ImportGraphDefOptions create.
	self library
		importGraphDefInto: self
		from: aTF_Buffer
		options: options
		status: status.
	options delete.
	status check
]

{ #category : #'initialize-release' }
TF_Graph >> importFileNamed: aString [
	| buffer |
	buffer := TF_Buffer fromFileNamed: aString.
	[self import: buffer] ensure: [buffer delete].
]

{ #category : #'initialize-release' }
TF_Graph >> importString: aString [
	| buffer |
	buffer := TF_Buffer fromString: aString.
	[self import: buffer] ensure: ["buffer delete"].
]

{ #category : #initialization }
TF_Graph >> initialize [
	context := ''
]

{ #category : #running }
TF_Graph >> initializeOn: aTF_Session [
	| initializers |
	initializers := self allInitializers collect: [ :each | each output: 0 ].
	initializers isNotEmpty
		ifTrue: [ aTF_Session runOutputs: initializers ]
]

{ #category : #'root operations' }
TF_Graph >> inputType: typeInteger [
	^ self
		newOperation: 'Placeholder'
		named: (self nameFor: 'input')
		described: [:description |
			description at: 'dtype' putType: typeInteger]
]

{ #category : #private }
TF_Graph >> library [
	^ TensorFlowCAPI current
]

{ #category : #operations }
TF_Graph >> mul: nameString described: aBlock [
	^self newOperation: 'Mul' named: nameString described: aBlock
]

{ #category : #'random operations' }
TF_Graph >> multinomialShaped: shapeConstant numSamples: aNumber [
	"Draws samples from a multinomial distribution."
	| numSamples|
	numSamples := self const: aNumber asInt32Tensor .

	^ shapeConstant op: 'Multinomial' withAll: {numSamples} named: 'Mltn' described:
	[:description |]
]

{ #category : #'root operations' }
TF_Graph >> nameFor: namePrefix [
	^ context, namePrefix,'_',self operationsCount printString.
]

{ #category : #operations }
TF_Graph >> newOperation: typeString named: aString [
	^ self newOperation: typeString named: aString described: [:unused | ]
]

{ #category : #operations }
TF_Graph >> newOperation: typeString named: aString described: aBlock [
	| description answer |
	description := self newOperationDescription: typeString named: aString.
	aBlock value: description.
	answer := description finish.
	answer graph: self.
	^ answer
]

{ #category : #operations }
TF_Graph >> newOperationDescription: typeString named: aString [
	^ self library newOperationDescriptionOn: self type: typeString named: aString

]

{ #category : #accessing }
TF_Graph >> newOperationIteratorContext [
	^ ByteArray new: 8
]

{ #category : #accessing }
TF_Graph >> operationAt: contextULongLongPtr [
	^ self library graph: self operationAt: contextULongLongPtr
]

{ #category : #accessing }
TF_Graph >> operationNamed: aString [
	| answer |
	answer := self library graph: self getOperationNamed: aString asAsciiZ.
	answer isNull ifTrue: [self error: 'Operation not found'].
	^ answer

]

{ #category : #accessing }
TF_Graph >> operationsCount [
	| answer |
	answer := 0.
	self operationsDo: [:each | answer := answer + 1].
	^ answer
]

{ #category : #accessing }
TF_Graph >> operationsDo: oneArgBlock [
	| iterator operation |
	iterator := self newOperationIteratorContext.
	[operation := self operationAt: iterator.
		operation isNull] whileFalse: [oneArgBlock value: operation].

]

{ #category : #accessing }
TF_Graph >> operationsSelect: oneArgBlock [
	| answer |
	answer := OrderedCollection new.
	
	self operationsSelect: oneArgBlock thenDo: [:op | answer add: op].
	
	^ answer asArray
]

{ #category : #accessing }
TF_Graph >> operationsSelect: conditionBlock thenDo: actionBlock [
	| answer |
	answer := OrderedCollection new.
	
	self operationsDo: [:op |
		(conditionBlock value: op)
			ifTrue: [actionBlock value: op]].
	
	^ answer asArray
]

{ #category : #outputs }
TF_Graph >> outputDimensionsCount: aTF_Output [
	| status answer |
	status := TF_Status create.
	answer := self library forGraph: self outputDims: aTF_Output status: status.
	status check.
	^ answer
]

{ #category : #'random operations' }
TF_Graph >> parametrizedTruncatedNormalShaped: shapeArray means: means stdevs: stdevs minVals:minVals maxVals:maxVals [
	| shape meansTensor stdevsTensor minValsTensor maxValsTensor |
	shape := self const: shapeArray asInt32Tensor.
	meansTensor := self const: means asFloatTensor.
	stdevsTensor := self const: stdevs asFloatTensor.
	minValsTensor := self const: minVals asFloatTensor.
	maxValsTensor := self const: maxVals asFloatTensor.	
	^ shape op: 'ParameterizedTruncatedNormal' withAll: {meansTensor. stdevsTensor. minValsTensor.maxValsTensor} named: 'Mltn' described:
	[:description |]
]

{ #category : #'random operations' }
TF_Graph >> parametrizedTruncatedNormalShaped: shapeArray stddev: aNumber [
	| random |
	random := self truncatedNormalRandomShaped: shapeArray.
	^ random @* (self const: aNumber asTensor)
]

{ #category : #'root operations' }
TF_Graph >> placeholder: nameString type: typeInteger [
	^ self
		newOperation: 'Placeholder'
		named: nameString
		described: [:description |
			description at: 'dtype' putType: typeInteger]
]

{ #category : #'random operations' }
TF_Graph >> randomGamma:shapeArray alpha: alpha [ 
	"Outputs random values from a uniform distribution."
	| shape alphaTensor |
	shape := self const: shapeArray asInt32Tensor.
	alphaTensor:= self const: alpha asFloatTensor.

	^ shape op: 'RandomGamma' withAll: {alphaTensor.} named: 'RG' described:
	[:description |]
]

{ #category : #'random operations' }
TF_Graph >> randomNormalShaped:shapeArray [
	"Outputs random values from a normal distribution"
	| shape |
	shape := self const: shapeArray asInt32Tensor.
	^ shape unaryOp: 'RandomStandardNormal' described: [:description |
		description at: 'dtype' putType: TF_Tensor typeFloat]
]

{ #category : #'random operations' }
TF_Graph >> randomNormalShaped: shapeArray stddev: aNumber [
	| random |
	random := self randomNormalShaped: shapeArray.
	^ random @* (self const: aNumber asTensor)
]

{ #category : #'random operations' }
TF_Graph >> randomPoisson:shapeArray rate: rate [ 
	"Outputs random values from a uniform distribution."
	| shape  rateTensor |
	shape := self const: shapeArray asInt32Tensor.
	rateTensor:= self const: rate asFloatTensor.

	^ shape op: 'RandomPoissonV2' withAll: {rateTensor.} named: 'RP' described:
	[:description |]
]

{ #category : #'random operations' }
TF_Graph >> randomShuffle: aTensor [
	
	| shape |
	shape := self const: aTensor.
	^ shape unaryOp: 'RandomShuffle' described: [:description |]
]

{ #category : #'random operations' }
TF_Graph >> randomUniformIntShaped:shapeArray minVal: minTensorAsArray maxVal:maxTensorAsArray [
	"Outputs random values from a uniform distribution."
	| shape mini maxi |
	shape := self const: shapeArray asInt32Tensor.
	mini:= self const: minTensorAsArray asInt32Tensor.
	maxi := self const: maxTensorAsArray  asInt32Tensor.
	^ shape op: 'RandomUniformInt' withAll: {mini. maxi.} named: 'RUI' described:
	[:description |]
]

{ #category : #'random operations' }
TF_Graph >> randomUniformShaped:shapeArray [
	"Outputs random values from a uniform distribution."
	| shape |
	shape := self const: shapeArray asInt32Tensor.
	^ shape unaryOp: 'RandomUniform' described: [:description |
		description at: 'dtype' putType: TF_Tensor typeFloat]
]

{ #category : #'random operations' }
TF_Graph >> randomUniformShaped: shapeArray stddev: aNumber [
	| random |
	random := self randomUniformIntShaped: shapeArray.
	^ random @* (self const: aNumber asTensor)
]

{ #category : #outputs }
TF_Graph >> rankOf: aTF_OutputOrInput [
	| status answer |
	status := TF_Status create.
	answer := self library graph: self getRankOf: aTF_OutputOrInput status: status.
	status check.
	^ answer
]

{ #category : #running }
TF_Graph >> runInputs: inArrayOfTF_Outputs values: inArrayOfTF_Tensor outputs: outArrayOfTF_Outputs [
	| session |
	session := TF_Session on: self.
	self initializeOn: session.
	^ session runInputs: inArrayOfTF_Outputs values: inArrayOfTF_Tensor outputs: outArrayOfTF_Outputs
]

{ #category : #running }
TF_Graph >> runOutput: aTF_Output [
	| session |
	session := TF_Session on: self.
	self initializeOn: session.
	^ session runOutput: aTF_Output
]

{ #category : #running }
TF_Graph >> runOutputs: anArrayOfTF_Outputs [
	| session |
	session := TF_Session on: self.
	self initializeOn: session.
	^ session runOutputs: anArrayOfTF_Outputs
]

{ #category : #outputs }
TF_Graph >> shapeOf: aTF_OutputOrInput [
	| status value size answer |
	size := self rankOf: aTF_OutputOrInput.
	value := FFIExternalArray externalNewType: 'int64' size: size.
	status := TF_Status create.
	self library
		graph: self
		getShapeOf: aTF_OutputOrInput
		into: value getHandle
		size: size
		status: status.
	status check.
	answer := (1 to: size) collect: [ :i | value at: i ].
	^ answer
]

{ #category : #outputs }
TF_Graph >> shapeOf: aTF_OutputOrInput set: shape [
	| status value |
	value := FFIExternalArray externalNewType: 'int64' fromArray: shape.
	status := TF_Status create.
	self library
		graph: self
		setShapeOf: aTF_OutputOrInput
		to: value getHandle
		size: shape size
		status: status.
	status check
]

{ #category : #'root operations' }
TF_Graph >> truncatedNormalRandomShaped: shapeArray [
	| shape |
	shape := self const: shapeArray asInt32Tensor.
	^ shape unaryOp: 'TruncatedNormal' described: [:description |
		description at: 'dtype' putType: TF_Tensor typeFloat]
]

{ #category : #'root operations' }
TF_Graph >> truncatedNormalRandomShaped: shapeArray stddev: aNumber [
	| random |
	random := self truncatedNormalRandomShaped: shapeArray.
	^ random @* (self const: aNumber asTensor)
]

{ #category : #'root operations' }
TF_Graph >> variable: nameString forTensor: aTF_Tensor [
	^ self variable: nameString type: aTF_Tensor type shape: aTF_Tensor shape
]

{ #category : #'root operations' }
TF_Graph >> variable: nameString initialValue: aTF_Tensor [
	| const var |
	var := self variable: nameString forTensor: aTF_Tensor.
	const := self const: nameString, '_initialValue' value: aTF_Tensor.
	var assign: const.
	^ var
]

{ #category : #'root operations' }
TF_Graph >> variable: nameString initialValueFrom: aTF_Operation [
	| output var shape |
	output := aTF_Operation output: 0.
	shape := self shapeOf: output.
	var := self variable: nameString type: output type shape: shape..
	var assign: aTF_Operation.
	^ var
]

{ #category : #'root operations' }
TF_Graph >> variable: nameString type: typeInteger shape: anArray [
	^ self
		newOperation: 'Variable'
		named: nameString
		described: [:description |
			description
				at: 'dtype' putType: typeInteger;
				at: 'shape' putShape: anArray]
]

{ #category : #debugging }
TF_Graph >> writeDefTo: strm [
	strm nextPutAll: self definition
]

{ #category : #debugging }
TF_Graph >> writeDefToFileNamed: filename [
	filename asFileReference writeStreamDo: [ :strm | self writeDefTo: strm ]
]

{ #category : #'root operations' }
TF_Graph >> zerosShaped: shapeArray [
	"This operation creates a tensor of shape shapeArray and fills it zero"
	
	| shape |
	shape := self const: shapeArray asInt32Tensor.
	^ shape binaryOp: 'Fill' with: 0.0 asTensor
]
