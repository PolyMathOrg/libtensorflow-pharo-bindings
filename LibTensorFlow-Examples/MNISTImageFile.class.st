Class {
	#name : #MNISTImageFile,
	#superclass : #MNISTFile,
	#instVars : [
		'rows',
		'columns'
	],
	#category : 'LibTensorFlow-Examples'
}

{ #category : #accessing }
MNISTImageFile class >> magic [
	^ 2051
]

{ #category : #accessing }
MNISTImageFile class >> testName [
	^ 't10k-images-idx3-ubyte'
]

{ #category : #accessing }
MNISTImageFile class >> trainName [
	^ 'train-images-idx3-ubyte'
]

{ #category : #converting }
MNISTImageFile >> asTensor [
	^  TF_Tensor fromFloats: items shape: {count. rows * columns}.
]

{ #category : #accessing }
MNISTImageFile >> bytesAt: imageIndex [
	| size base |
	size := columns * rows.
	base := (imageIndex - 1) * size + 1.
	^ items copyFrom: base to: base + size - 1.
]

{ #category : #accessing }
MNISTImageFile >> bytesAt: base take: batchSize [
	^ (base to: base + batchSize -1) collect:[:index| self bytesAt: index]
]

{ #category : #accessing }
MNISTImageFile >> columns [
	^ columns
]

{ #category : #accessing }
MNISTImageFile >> formAt: imageIndex [
	| bytes |
	bytes := self bytesAt: imageIndex.
	^ Form extent: rows @ columns depth: 1 bits: bytes
]

{ #category : #initialization }
MNISTImageFile >> parse: aReader [
	super parse: aReader.
	rows := (aReader dimensionSizes) second.
	columns := (aReader dimensionSizes) third.
	items := aReader next.
	items := (items flatCollect: [:each | each ]) flatCollect:[:each | each]
]

{ #category : #accessing }
MNISTImageFile >> rows [
	^ rows
]
