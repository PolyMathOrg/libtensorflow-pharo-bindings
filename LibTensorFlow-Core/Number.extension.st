Extension { #name : #Number }

{ #category : #'*LibTensorFlow-Core' }
Number >> asFloatTensor [
	^ TF_Tensor fromFloats: self
]

{ #category : #'*LibTensorFlow-Core' }
Number >> asInt32Tensor [
	^ TF_Tensor fromInt32s: self
]

{ #category : #'*LibTensorFlow-Core' }
Number >> asInt64Tensor [
	^ TF_Tensor fromInt64s: self
]
