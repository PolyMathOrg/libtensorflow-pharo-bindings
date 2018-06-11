Class {
	#name : #MNISTFile,
	#superclass : #Object,
	#instVars : [
		'count',
		'items'
	],
	#category : #'LibTensorFlow-Examples'
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
	| file filename reader compressed|
	filename := aString, '.gz'.
	file := ('dataset/', filename) asFileReference.
	file exists ifFalse:[ file := self download: filename].
	compressed := file binaryReadStream.
	reader := IdxReader onStream: ((GZipReadStream on: compressed) upToEnd asByteArray readStream).
	^ self fromReader: reader
	
]

{ #category : #'instance creation' }
MNISTFile class >> fromReader: aReader [
	| answer |
	answer := self new.
	^ answer parse: aReader
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

{ #category : #initialization }
MNISTFile >> parse: aReader [
	count := (aReader dimensionSizes) at:1
]
