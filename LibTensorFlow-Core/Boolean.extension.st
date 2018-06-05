Extension { #name : #Boolean }

{ #category : #'*LibTensorFlow-Core' }
Boolean >> asBooleanTensor [
	^ TF_Tensor fromBooleans: self
]
