Extension { #name : #Object }

{ #category : #'*LibTensorFlow-Core' }
Object >> byteSize [

^8
]

{ #category : #'*LibTensorFlow-Core' }
Object >> ignoreFinalization [
	self finalizationRegistry remove: self ifAbsent: [  ]
]

{ #category : #'*LibTensorFlow-Core' }
Object >> useFinalization [
	self finalizationRegistry add: self
]
