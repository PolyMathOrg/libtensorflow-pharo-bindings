Class {
	#name : #TensorFlowCAPISlowTests,
	#superclass : #TestCase,
	#category : #'LibTensorFlow-Core'
}

{ #category : #'testing tensor' }
TensorFlowCAPISlowTests >> mulGraphTwoInputsInt64ConstTensorDeleted [
	^ TensorFlowCAPITest new mulGraphTwoInputsInt64ConstTensorDeleted
]

{ #category : #'testing graph' }
TensorFlowCAPISlowTests >> testGraphFinalizationReleasesExternalMemory [
	" WeakArray restartFinalizationProcess "

	| tries total handles |
	total := 0.
	tries := 10.
	handles := Set new.
	20
		timesRepeat: [ total := total + tries.
			handles
				addAll:
					((1 to: tries)
						collect: [ :i | 
							Smalltalk garbageCollect.
							TF_Graph create useFinalization getHandle ]).
			handles size < total
				ifTrue: [ ^ self ] ].
	self assert: handles size < total
]

{ #category : #'testing tensor' }
TensorFlowCAPISlowTests >> testRunGraphMulTwoInputsConstTensorDeleted [
	| graph inputs inputValues mul output session results |
	graph := self mulGraphTwoInputsInt64ConstTensorDeleted.
	inputs := Array with: ((graph operationNamed: 'in1') input: 0) with: ((graph operationNamed: 'in2') input: 0).
	inputValues := Array with: (TF_Tensor fromInt64: 16r23) with: (TF_Tensor fromInt64: 16r24).
	Smalltalk garbageCollect.
	(TF_Tensor fromInt64: 16r1234123412341234) useFinalization.
	Smalltalk garbageCollect.
	mul := graph operationNamed: 'mul2'.
	output := mul output: 0.
	session := TF_Session on: graph.
	results := session
		runOperations: (Array with: mul)
		inputs: inputs
		values: inputValues
		outputs: (Array with: output).
	self deny: results isNull.
	self deny: results first isNull.
	self deny: results first data isNull.
	self assert: (results first data getHandle signedLongLongAt: 1) equals: (16r2121212121212121 * 16r23 * 16r24 bitAnd: 16rFFFFFFFFFFFFFFFF).
	graph delete.
	results first delete
]

{ #category : #'testing tensor' }
TensorFlowCAPISlowTests >> testRunGraphMulTwoInputsConstTensorDeletedManyTimes [
	20 timesRepeat: [ self testRunGraphMulTwoInputsConstTensorDeleted ]
]

{ #category : #'testing session' }
TensorFlowCAPISlowTests >> testSessionFinalizationReleasesExternalMemory [ 
	" WeakArray restartFinalizationProcess "
	| tries total handles graph |
	total := 0.
	tries := 20.
	graph := TF_Graph create.
	handles := Set new.
	
	20 timesRepeat: [
		total := total + tries.
		handles addAll: ((1 to: tries) collect: [:i |
			Smalltalk garbageCollect.
			(TF_Session on: graph) getHandle]).
		handles size < total ifTrue: [
			^ self]].
	
	self assert: (handles size) < total.

]

{ #category : #'testing options' }
TensorFlowCAPISlowTests >> testSessionOptionFinalizationReleasesExternalMemory [
	" WeakArray restartFinalizationProcess "

	| tries total handles |
	total := 0.
	tries := 10.
	handles := Set new.
	20
		timesRepeat: [ total := total + tries.
			handles
				addAll:
					((1 to: tries)
						collect: [ :i | 
							Smalltalk garbageCollect.
							TF_SessionOptions create getHandle ]).
			handles size < total
				ifTrue: [ ^ self ] ].
	self assert: handles size < total
]

{ #category : #'testing status' }
TensorFlowCAPISlowTests >> testStatusFinalizationReleasesExternalMemory [
	" WeakArray restartFinalizationProcess "
	| handles |
	handles := (1 to: 11) collect: [:i |
		Smalltalk garbageCollect.
		TF_Status create getHandle].

	self assert: (handles asSet size) < 11.
]

{ #category : #'testing tensor' }
TensorFlowCAPISlowTests >> testTensorFinalizationReleasesExternalMemory [
	" WeakArray restartFinalizationProcess "

	| handles template tries total |
	total := 0.
	tries := 20.
	handles := Set new.
	template := {(String new: 10).
	(String new: 100).
	(String new: 1000)}.
	20
		timesRepeat: [ total := total + tries.
			handles
				addAll:
					((1 to: tries)
						collect: [ :i | 
							Smalltalk garbageCollect.
							(TF_Tensor fromStringArray: template) getHandle ]).
			handles size < total
				ifTrue: [ ^ self ] ].
	self assert: handles size < total
]
