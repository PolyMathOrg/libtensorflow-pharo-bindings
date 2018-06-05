Class {
	#name : #'TF_Session',
	#superclass : #FFIOpaqueObject,
	#category : 'LibTensorFlow-Core'
}

{ #category : #'instance creation' }
TF_Session class >> finalizeResourceData: handle [
	| status |
	handle isNull
		ifTrue: [ ^ self ].
	status := TF_Status create.
	(TensorFlowCAPI current) closeSession: handle status: status.
	status check.
	status := TF_Status create.
	(TensorFlowCAPI current) deleteSession: handle status: status.
	status check
]

{ #category : #'instance creation' }
TF_Session class >> on: aTF_Graph [
	| options status answer |
	options := TF_SessionOptions create.
	status := TF_Status create.
	answer := TensorFlowCAPI current newSession: aTF_Graph options: options status: status.
	status check.
	^ answer autoRelease
]

{ #category : #release }
TF_Session >> close [
"deprecated"
	| status |
	status := TF_Status create.
	self library closeSession: self status: status.
	status check
]

{ #category : #release }
TF_Session >> delete [
| status |
"deprecated"
self halt.
	self ignoreFinalization.
	self isNull ifFalse: [
		self close.
		status := TF_Status create.
		self library
			deleteSession: self
			status: status.
		status check.
	].
	handle := nil.

]

{ #category : #release }
TF_Session >> finalize [
"deprecated"
self halt.
	[self delete] on: Error do: [
		Transcript
			cr;
			print: 'Error finalizing ';
			show: self
	].
]

{ #category : #release }
TF_Session >> library [
	^ TensorFlowCAPI current
]

{ #category : #running }
TF_Session >> run [
	| status |
	status := TF_Status create.
	self library
		runSession: self
		options: nil
		inputs: nil
		values: nil
		count: 0
		outputs: nil
		values: nil
		count: 0
		targets: nil
		count: 0
		metadata: nil
		status: status.
	status check
]

{ #category : #running }
TF_Session >> runInputs: inArrayOfTF_Outputs values: inArrayOfTF_Tensor outputs: outArrayOfTF_Outputs [
	| inputs invalues outputs outvalues status |
	status := TF_Status create.
	inputs := TF_OutputArray fromCollection: inArrayOfTF_Outputs.
	invalues := TF_TensorPtrArray fromCollection: inArrayOfTF_Tensor.
	outputs := TF_OutputArray fromCollection: outArrayOfTF_Outputs.
	outvalues := TF_TensorPtrArray externalNew: outArrayOfTF_Outputs size.
	
	self library
		runSession: self options: nil
		inputs: inputs getHandle values: invalues getHandle count: inArrayOfTF_Outputs size
		outputs: outputs getHandle values: outvalues getHandle count: outArrayOfTF_Outputs size
		targets: nil count: 0
		metadata: nil status: status.
		
	status check.
	^ outvalues asArray

]

{ #category : #running }
TF_Session >> runOperation: aTF_Operation [
	^ self runOperations: (Array with: aTF_Operation)
]

{ #category : #running }
TF_Session >> runOperation: aTF_Operation input: inTF_OutputOrInput value: inTF_Tensor output: outTF_Output [
	| inputs invalues operations outputs outvalues tensor |
	inputs := Array with: inTF_OutputOrInput.
	invalues := Array with: inTF_Tensor.
	outputs := Array with: outTF_Output.
	operations := Array with: aTF_Operation.
	outvalues := self
		runOperations: operations
		inputs: inputs
		values: invalues
		outputs: outputs.
	tensor := outvalues first.
	^ tensor
]

{ #category : #running }
TF_Session >> runOperation: aTF_Operation output: aTF_Output [
	| operations answer outputs |
	operations := TF_OperationPtrArray externalNew: 1.
	outputs := TF_OutputArray externalNew: 1.
	outputs at:1 put: aTF_Output.
	operations at:1 put: aTF_Operation getHandle getHandle.
	answer := self runOperations: operations outputs: outputs size: 1.
	^ answer first
]

{ #category : #running }
TF_Session >> runOperations: anArrayOfTF_Operations [
	| status operations |
	status := TF_Status create.
	operations := TF_OperationPtrArray fromCollection: anArrayOfTF_Operations.
	self library
		runSession: self
		options: nil
		inputs: nil
		values: nil
		count: 0
		outputs: nil
		values: nil
		count: 0
		targets: operations getHandle
		count: anArrayOfTF_Operations size
		metadata: nil
		status: status.
	status check
]

{ #category : #running }
TF_Session >> runOperations: anArrayOfTF_Operations inputs: inArrayOfTF_Outputs values: inArrayOfTF_Tensor outputs: outArrayOfTF_Outputs [
	| operations inputs invalues outputs outvalues status |
	status := TF_Status create.
	operations := TF_OperationPtrArray fromCollection: anArrayOfTF_Operations.
	inputs := TF_OutputArray fromCollection: inArrayOfTF_Outputs.
	invalues := TF_TensorPtrArray fromCollection: inArrayOfTF_Tensor.
	outputs := TF_OutputArray fromCollection: outArrayOfTF_Outputs.
	outvalues := TF_TensorPtrArray externalNew: outArrayOfTF_Outputs size.
	
	self library
		runSession: self options: nil
		inputs: inputs getHandle values: invalues count: inArrayOfTF_Outputs size
		outputs: outputs getHandle values: outvalues count: outArrayOfTF_Outputs size
		targets: operations getHandle count: anArrayOfTF_Operations size
		metadata: nil status: status.
		
	status check.
	^ outvalues asArray

]

{ #category : #running }
TF_Session >> runOperations: aTF_OperationArray outputs: aTF_OutputArray size: anInteger [
	| status outvalues |
	status := TF_Status create.
	outvalues := TF_TensorPtrArray externalNew: anInteger.
	self library
		runSession: self
		options: nil
		inputs: nil
		values: nil
		count: 0
		outputs: aTF_OutputArray getHandle
		values: outvalues getHandle
		count: anInteger
		targets: aTF_OperationArray getHandle
		count: 1
		metadata: nil
		status: status.
	status check.
	^ outvalues asArray
]

{ #category : #running }
TF_Session >> runOutput: aTF_Output [
	| results |
	results := self runOutputs: {aTF_Output}.
	^ results first
]

{ #category : #running }
TF_Session >> runOutputs: anArrayOfTF_Outputs [
	| outputs |
	outputs := TF_OutputArray fromCollection: anArrayOfTF_Outputs.
	^ self runOutputs: outputs size: anArrayOfTF_Outputs size
]

{ #category : #running }
TF_Session >> runOutputs: aTF_OutputArray size: anInteger [
	| status outvalues |
	status := TF_Status create.
	outvalues := TF_TensorPtrArray externalNew: anInteger.
	self library
		runSession: self
		options: nil
		inputs: nil
		values: nil
		count: 0
		outputs: aTF_OutputArray getHandle
		values: outvalues getHandle
		count: anInteger
		targets: nil
		count: 0
		metadata: nil
		status: status.
	status check.
	^ outvalues asArray
]
