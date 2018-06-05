Class {
	#name : #MNISTFile,
	#superclass : #Object,
	#instVars : [
		'magic',
		'count',
		'items'
	],
	#category : 'LibTensorFlow-Examples'
}

{ #category : #private }
MNISTFile class >> download: aName [	
	| url response content file |
		url := 'http://yann.lecun.com/exdb/mnist/', aName.
		response := ZnClient new get: url.
		content := response asByteArray.
		(FileSystem disk workingDirectory fileSystem) createDirectory: 'dataset'.
		file := ('dataset/', name) asFileReference.
		file writeStreamDo: [ :stream | 
    stream 
         nextPutAll: content ].
		^ file
]

{ #category : #'instance creation' }
MNISTFile class >> fromFile: aString [
	| file filename stream compressed|
	filename := aString, '.gz'.
	file := ('dataset/', filename) asFileReference.
	file exists ifFalse:[ file := self download: filename].
	compressed := file readStream.
	stream := (GZipReadStream on: compressed) upToEnd asByteArray readStream.
	^ self fromStream: stream
	
]

{ #category : #'instance creation' }
MNISTFile class >> fromStream: aStream [
	| answer |
	answer := self new.
	^ answer parse: aStream
]

{ #category : #accessing }
MNISTFile class >> magic [
	^ self subclassResponsibility 
]

{ #category : #accessing }
MNISTFile class >> testName [
	^ self subclassResponsibility 
]

{ #category : #'instance creation' }
MNISTFile class >> testSet [
	^self fromFile: self testName
	
]

{ #category : #accessing }
MNISTFile class >> trainName [
	^ self subclassResponsibility 
]

{ #category : #'instance creation' }
MNISTFile class >> trainingSet [
	^self fromFile: self trainName
	
]

{ #category : #converting }
MNISTFile >> asTensor [
	^ self subclassResponsibility 
]

{ #category : #accessing }
MNISTFile >> count [
	^ count
]

{ #category : #accessing }
MNISTFile >> items [
	^ items
]

{ #category : #accessing }
MNISTFile >> magic [
	^ magic
]

{ #category : #initialization }
MNISTFile >> parse: aStream [
	magic := aStream nextUnsignedInt32BigEndian: true.
	count :=  aStream nextUnsignedInt32BigEndian: true.

	
]
