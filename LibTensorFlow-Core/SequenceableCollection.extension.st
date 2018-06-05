Extension { #name : #SequenceableCollection }

{ #category : #'*LibTensorFlow-Core' }
SequenceableCollection >> asBooleanTensor [
	^ TF_Tensor fromBooleans: self
]

{ #category : #'*LibTensorFlow-Core' }
SequenceableCollection >> asFloatTensor [
	^ TF_Tensor fromFloats: self
]

{ #category : #'*LibTensorFlow-Core' }
SequenceableCollection >> asInt32Tensor [
	^ TF_Tensor fromInt32s: self
]

{ #category : #'*LibTensorFlow-Core' }
SequenceableCollection >> asInt64Tensor [
	^ TF_Tensor fromInt64s: self
]

{ #category : #'*LibTensorFlow-Core' }
SequenceableCollection class >> streamContents: blockWithArg estimatedSize: estimatedSize [

"Apparently a method coming from Cuis"
"We will rewrite this method later"

	| stream originalContents |
	stream := WriteStream on: (self new: estimatedSize).
	blockWithArg value: stream.
	originalContents := stream originalContents.
	^ stream position = originalContents size
		ifTrue: [ originalContents ]
		ifFalse: [ stream contents ]
]
