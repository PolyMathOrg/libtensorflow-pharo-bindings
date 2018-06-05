Class {
	#name : #MNISTLabelFile,
	#superclass : #MNISTFile,
	#category : 'LibTensorFlow-Examples'
}

{ #category : #accessing }
MNISTLabelFile class >> magic [
	^ 2049
]

{ #category : #accessing }
MNISTLabelFile class >> testName [
	^ 't10k-labels-idx1-ubyte'
]

{ #category : #accessing }
MNISTLabelFile class >> trainName [
	^ 'train-labels-idx1-ubyte'
]

{ #category : #converting }
MNISTLabelFile >> asTensor [
	^ items asInt32Tensor 
]

{ #category : #accessing }
MNISTLabelFile >> at: index [
	^ items at: index
]

{ #category : #accessing }
MNISTLabelFile >> at: base take: batchSize [
	^ (base to: base + batchSize - 1) collect:[:index| self at: index]
]

{ #category : #initialization }
MNISTLabelFile >> parse: aStream [
	super parse: aStream.
	items := aStream upToEnd.
	
	
]
