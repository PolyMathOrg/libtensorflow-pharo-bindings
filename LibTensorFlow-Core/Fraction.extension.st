Extension { #name : #Fraction }

{ #category : #'*LibTensorFlow-Core' }
Fraction >> asTensor [
	^ TF_Tensor fromFloats: self
]
