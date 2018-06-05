Extension { #name : #Float }

{ #category : #'*LibTensorFlow-Core' }
Float >> asTensor [
	^ TF_Tensor fromFloats: self
]
