Extension { #name : #String }

{ #category : #'*LibTensorFlow-Core' }
String >> asAsciiZ [
	^ self , Character null asString
]

{ #category : #'*LibTensorFlow-Core' }
String >> asTensor [
	^ TF_Tensor fromString: self
]
