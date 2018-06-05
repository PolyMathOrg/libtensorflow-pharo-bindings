Extension { #name : #Collection }

{ #category : #'*LibTensorFlow-Core' }
Collection >> product [
	"Cuis method. To be removed later"
	"Compute the product of all the elements in the receiver"
	^self fold:[ :a :b | a * b]
]
