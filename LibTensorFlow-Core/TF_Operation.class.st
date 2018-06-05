"
Operation that has been added to the graph. Valid until the graph is deleted -- in particular adding a new operation to the graph does not  invalidate old TF_Operation* pointers.
"
Class {
	#name : #'TF_Operation',
	#superclass : #FFIOpaqueObject,
	#instVars : [
		'graph',
		'output'
	],
	#category : 'LibTensorFlow-Core'
}

{ #category : #'ops binary' }
TF_Operation >> * aTF_Operation [
	^ self binaryOp: 'MatMul' with: aTF_Operation
]

{ #category : #'ops binary' }
TF_Operation >> *\ aTF_Operation [
	^ self
		binaryOp: 'MatMul'
		with: aTF_Operation
		described: [ :description | description at: 'transpose_b' putBoolean: true ]
]

{ #category : #'ops binary' }
TF_Operation >> + aTF_Operation [
	^ self binaryOp: 'Add' with: aTF_Operation
]

{ #category : #'ops binary' }
TF_Operation >> += aTF_Operation [
	"Update self by adding a value"

	^ self binaryOp: 'AssignAdd' with: aTF_Operation
]

{ #category : #'ops binary' }
TF_Operation >> - aTF_Operation [
	^ self binaryOp: 'Sub' with: aTF_Operation
]

{ #category : #'ops binary' }
TF_Operation >> -= aTF_Operation [
"Update self by subtracting a value"

	^ self binaryOp: 'AssignSub' with: aTF_Operation
]

{ #category : #comparing }
TF_Operation >> = aTF_Operation [
	^ self class = aTF_Operation class and: [ handle = aTF_Operation getHandle ]
]

{ #category : #'ops binary' }
TF_Operation >> > aTF_Operation [
	^ self binaryOp: 'Greater' with: aTF_Operation
]

{ #category : #'ops binary' }
TF_Operation >> @* aTF_Operation [
	^ self binaryOp: 'Mul' with: aTF_Operation
]

{ #category : #'ops binary' }
TF_Operation >> @/ aTF_Operation [
	^ self binaryOp: 'Div' with: aTF_Operation
]

{ #category : #accessing }
TF_Operation >> InputsCount [
	^ self library operationNumInputs: self
]

{ #category : #'ops binary' }
TF_Operation >> \* aTF_Operation [
	^ self
		binaryOp: 'MatMul'
		with: aTF_Operation
		described: [ :description | description at: 'transpose_a' putBoolean: true ]
]

{ #category : #'ops binary' }
TF_Operation >> \*\ aTF_Operation [
	^ self
		binaryOp: 'MatMul'
		with: aTF_Operation
		described: [ :description | 
			description at: 'transpose_a' putBoolean: true.
			description at: 'transpose_b' putBoolean: true ]
]

{ #category : #'ops binary' }
TF_Operation >> \\ aTF_Operation [
"Returns element-wise remainder of division"
	^ self binaryOp: 'Mod' with: aTF_Operation
]

{ #category : #'ops unary' }
TF_Operation >> abs [
	^ self unaryOp: 'Abs'
]

{ #category : #'ops unary' }
TF_Operation >> alias: nameString [
	^ self unaryOp: 'Identity' named: nameString
]

{ #category : #'ops unary' }
TF_Operation >> arcCos [
	^ self unaryOp: 'Acos'
]

{ #category : #'ops unary' }
TF_Operation >> arcSin [
	^ self unaryOp: 'Asin'
	
]

{ #category : #'ops unary' }
TF_Operation >> arcTan [
	^ self unaryOp: 'Atan'
	
]

{ #category : #converting }
TF_Operation >> asOperationOn: aTF_Graph [
	graph == aTF_Graph
		ifTrue: [^ self]
		ifFalse: [^ self error: 'Can''t move an operation to another Graph']
]

{ #category : #'ops binary' }
TF_Operation >> assign: aTF_Operation [
	^ self
		binaryOp: 'Assign'
		with: aTF_Operation
		named: self name, '_initializer'
]

{ #category : #attributes }
TF_Operation >> attrMetadata: nameString [
	| status answer |
	status := TF_Status create.
	answer := self library operation: self getMetadataFor: nameString asAsciiZ status: status.
	status check.
	^ answer
]

{ #category : #'ops binary' }
TF_Operation >> binaryOp: aString with: aTF_Operation [
	^ self binaryOp: aString with: aTF_Operation described: [ :nothing |  ]
]

{ #category : #'ops binary' }
TF_Operation >> binaryOp: aString with: aTF_Operation described: oneArgBlock [
	| name |
	name := self nameFor: aString.
	^ self
		binaryOp: aString
		with: aTF_Operation
		named: name
		described: oneArgBlock
]

{ #category : #'ops binary' }
TF_Operation >> binaryOp: aString with: aTF_Operation named: name [
	^ self binaryOp: aString with: aTF_Operation named: name described: [:nothing]

]

{ #category : #'ops binary' }
TF_Operation >> binaryOp: aString with: aTF_Operation named: name described: oneArgBlock [
	^ self op: aString withAll: {aTF_Operation} named: name described: oneArgBlock
]

{ #category : #attributes }
TF_Operation >> boolAt: nameString [
	| value status |
	status := TF_Status create.
	value := ByteArray new: 1.
	self library
		operation: self
		attr: nameString asAsciiZ
		getBool: value
		status: status.
	status check.
	^ value booleanAt: 1
]

{ #category : #'ops binary' }
TF_Operation >> castTo: typeInteger [
	^ self unaryOp: 'Cast' described: [ :description | description at: 'DstT' putType: typeInteger ]
]

{ #category : #'ops unary' }
TF_Operation >> cos [
	^ self unaryOp: 'Cos'
]

{ #category : #'ops other' }
TF_Operation >> descent: delta rate: learningRate [
	^ self
		op: 'ApplyGradientDescent'
		withAll:
			{learningRate.
			delta}
]

{ #category : #accessing }
TF_Operation >> device [
"The name of the device to which this op has been assigned, if any.
Returns: The string name of the device to which this op has been assigned, or an empty string if it has not been assigned to a device."
	^ self library operationDevice: self
]

{ #category : #'ops unary' }
TF_Operation >> exp [
	^ self unaryOp: 'Exp'
]

{ #category : #'ops binary' }
TF_Operation >> findMaxOn: aTF_Operation [
	^ self binaryOp: 'ArgMax' with: aTF_Operation
]

{ #category : #'ops binary' }
TF_Operation >> findMinOn: aTF_Operation [
	^ self binaryOp: 'ArgMin' with: aTF_Operation
]

{ #category : #attributes }
TF_Operation >> floatAt: nameString [
	| value status |
	status := TF_Status create.
	value := ByteArray new: 8.
	self library
		operation: self
		attr: nameString asAsciiZ
		getFloat: value
		status: status.
	status check.
	^ value floatAt: 1
]

{ #category : #accessing }
TF_Operation >> graph [
"The Graph that contains this operation."
	^ graph
]

{ #category : #accessing }
TF_Operation >> graph: aTF_Graph [
	graph := aTF_Graph
]

{ #category : #'ops unary' }
TF_Operation >> identity [
	^ self unaryOp: 'Identity'
	
]

{ #category : #accessing }
TF_Operation >> input: indexInteger [
	^ TF_Input onOperation: self index: indexInteger
]

{ #category : #attributes }
TF_Operation >> intAt: nameString [
	| value status |
	status := TF_Status create.
	value := ByteArray new: 8.
	self library operation: self attr: nameString asAsciiZ getInt64: value status: status.
	status check.
	^ value unsignedLongLongAt: 1

]

{ #category : #'ops unary' }
TF_Operation >> inverse [
	^ self unaryOp: 'MatrixInverse'
]

{ #category : #'ops binary' }
TF_Operation >> library [
	^ TensorFlowCAPI current
]

{ #category : #'ops binary' }
TF_Operation >> meanOn: shapeTensorOrOperation [
	^ self binaryOp: 'Mean' with: shapeTensorOrOperation
]

{ #category : #accessing }
TF_Operation >> name [
"The full name of this operation"
	^ self library operationName: self
]

{ #category : #'ops other' }
TF_Operation >> nameFor: namePrefix [
	^ graph nameFor: namePrefix
]

{ #category : #'ops unary' }
TF_Operation >> negated [
	^ self unaryOp: 'Neg'
]

{ #category : #'ops other' }
TF_Operation >> op: aString withAll: aTF_OperationArray [
	^ self op: aString withAll: aTF_OperationArray described: [:nothing]

]

{ #category : #'ops other' }
TF_Operation >> op: aString withAll: aTF_OperationArray described: oneArgBlock [
	| name |
	name := self nameFor: aString.
	^ self op: aString withAll: aTF_OperationArray named: name described: oneArgBlock
]

{ #category : #'ops other' }
TF_Operation >> op: aString withAll: aTF_OperationArray named: name [
	^ self op: aString withAll: aTF_OperationArray named: name described: [:nothing]

]

{ #category : #'ops other' }
TF_Operation >> op: aString withAll: aTF_OperationArray named: name described: oneArgBlock [
	^ graph newOperation: aString named: name described: [:description |
		description addInput: self output.
		aTF_OperationArray do: [:each |
			| input |
			input := (each asOperationOn: graph) output.
			description addInput: input].
		oneArgBlock value: description].
	
]

{ #category : #initialization }
TF_Operation >> output [
"The list of Tensor objects representing the outputs of this op."

	output ifNil: [ output := 0 ].
	^ self output: output
]

{ #category : #accessing }
TF_Operation >> output: indexInteger [
	^ TF_Output onOperation: self index: indexInteger
]

{ #category : #accessing }
TF_Operation >> outputsCount [
	^ self library operationNumOutputs: self
]

{ #category : #printing }
TF_Operation >> printOn: stream [
	super printOn: stream.
"	handle isNull
		ifFalse: [ stream
				space;
				print: self type;
				space;
				print: self name ]"
]

{ #category : #'ops unary' }
TF_Operation >> rectified [
	"Computes rectified linear: max(features, 0)"

	^ self unaryOp: 'Relu'
]

{ #category : #'ops unary' }
TF_Operation >> shape [
	^ self unaryOp: 'Shape'
]

{ #category : #attributes }
TF_Operation >> shapeAt: nameString [
	| value status size answer |
	size := (self attrMetadata: nameString) total_size.
	(size = -1) ifTrue:[^#()].
	status := TF_Status create.
	value := FFIExternalArray externalNewType: 'int64' size: size.
	
	self library
		operation: self
		attr: nameString asAsciiZ
		getShape: value getHandle
		size: size
		status: status.
	status check.

	answer := (1 to: size) collect: [:i | value at: i].
	^ answer
]

{ #category : #'ops unary' }
TF_Operation >> sigmoid [
	^ self unaryOp: 'Sigmoid'
]

{ #category : #'ops unary' }
TF_Operation >> sin [
	^ self unaryOp: 'Sin'
	
]

{ #category : #'ops binary' }
TF_Operation >> sizeOn: dimensionInteger [
	^ self shape sliceFrom: {dimensionInteger} asInt32Tensor size: #(1) asInt32Tensor.
]

{ #category : #'ops other' }
TF_Operation >> sliceFrom: begin size: size [
	^ self op: 'Slice' withAll: {begin. size}
]

{ #category : #'ops unary' }
TF_Operation >> softmax [
	^ self unaryOp: 'Softmax'

]

{ #category : #'ops binary' }
TF_Operation >> sparseSoftmaxCrossEntropyWithLogits: aTF_Operation [
	^ self
		binaryOp: 'SparseSoftmaxCrossEntropyWithLogits'
		with: aTF_Operation
		named: (self nameFor: 'SparseSoftmaxCrossEntropyWithLogits')
]

{ #category : #'ops unary' }
TF_Operation >> squared [
	^ self @* self
	
]

{ #category : #attributes }
TF_Operation >> stringAt: nameString [
	| metadata value status |
	metadata := self attrMetadata: nameString.
	status := TF_Status create.
	value := ByteArray new: metadata total_size.
	self library
		operation: self
		attr: nameString asAsciiZ
		getString: value
		size: metadata total_size 
		status: status.
	status check.
	^ value asString

]

{ #category : #attributes }
TF_Operation >> stringsAt: nameString [
	| status pointers sizes spaceRequired storage metadata valuesCount |
	metadata := self attrMetadata: nameString.
	spaceRequired := metadata totalSize.
	valuesCount := metadata listSize.
	pointers := ByteArray new: Smalltalk wordSize * valuesCount.
	sizes := (FFIExternalArray externalNewType: 'int64' size: valuesCount) autoRelease.
	storage := ExternalAddress gcallocate: spaceRequired.
	status := TF_Status create.
	self library
		operation: self
		attr: nameString asAsciiZ 
		getStrings: pointers
		sizes: sizes getHandle
		maxCount: valuesCount
		storage: storage
		size: spaceRequired
		status: status.
	status check.
	^ (1 to: valuesCount) collect: [:i |
		| one |
		one := pointers pointerAt: i-1*Smalltalk wordSize+1.
		one := one structAt: 1 length: (sizes at: i).
		one asString]
]

{ #category : #'ops binary' }
TF_Operation >> sumOn: aTF_Operation [
	^ self binaryOp: 'Sum' with: aTF_Operation
]

{ #category : #'ops unary' }
TF_Operation >> tan [
	^ self unaryOp: 'Tan'
	
]

{ #category : #attributes }
TF_Operation >> tensorAt: nameString [
	| value status |
	status := TF_Status create.
	value := ByteArray new: ExternalAddress wordSize.
	self library operation: self attr: nameString asAsciiZ getTensor: value status: status.
	status check.
	^ TF_Tensor fromHandle: (value pointerAt: 1)

]

{ #category : #'ops binary' }
TF_Operation >> timesRectifiedGradOf: aTF_Operation [
	^ self binaryOp: 'ReluGrad' with: aTF_Operation
]

{ #category : #accessing }
TF_Operation >> type [
"The type of the op (e.g. MatMul)."
	^ self library operationOpType: self
]

{ #category : #attributes }
TF_Operation >> typeAt: nameString [
	| value status |
	status := TF_Status create.
	value := ByteArray new: 8.
	self library operation: self attr: nameString asAsciiZ getType: value status: status.
	status check.
	^ value unsignedLongLongAt: 1

]

{ #category : #'ops unary' }
TF_Operation >> unaryOp: aString [
	| name |
	name := self nameFor: aString.
	^ self unaryOp: aString named: name
]

{ #category : #'ops unary' }
TF_Operation >> unaryOp: aString described: oneArgBlock [
	| name |
	name := self nameFor: aString.
	^ self unaryOp: aString named: name described: oneArgBlock
]

{ #category : #'ops unary' }
TF_Operation >> unaryOp: aString named: name [
	^ self unaryOp: aString named: name described: [:description | ].
	
]

{ #category : #'ops unary' }
TF_Operation >> unaryOp: aString named: name described: oneArgBlock [
	^ self op: aString withAll: {} named: name described: oneArgBlock
]

{ #category : #accessing }
TF_Operation >> useOutput: anInteger [
	output := anInteger
]
