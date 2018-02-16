*LibTensorFlow-Core
streamContents: blockWithArg estimatedSize: estimatedSize

"Apparently a method coming from Cuis"
"We will rewrite this method later"

	| stream originalContents |
	stream := WriteStream on: (self new: estimatedSize).
	blockWithArg value: stream.
	originalContents := stream originalContents.
	^ stream position = originalContents size
		ifTrue: [ originalContents ]
		ifFalse: [ stream contents ]