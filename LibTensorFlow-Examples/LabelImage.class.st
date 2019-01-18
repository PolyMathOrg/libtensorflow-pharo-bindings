Class {
	#name : #LabelImage,
	#superclass : #Object,
	#instVars : [
		'imageSize',
		'inputMean',
		'inputStddev',
		'imageFile',
		'graphFile',
		'labelsFile',
		'graph',
		'session',
		'inputValues',
		'top_n'
	],
	#category : #'LibTensorFlow-Examples'
}

{ #category : #accessing }
LabelImage >> graphFile [
	^ graphFile
]

{ #category : #accessing }
LabelImage >> graphFile: anObject [
	graphFile := anObject
]

{ #category : #accessing }
LabelImage >> imageFile [
	^ imageFile
]

{ #category : #accessing }
LabelImage >> imageFile: anObject [
	imageFile := anObject
]

{ #category : #accessing }
LabelImage >> imageSize [
	^ imageSize
]

{ #category : #accessing }
LabelImage >> imageSize: anObject [
	imageSize := anObject
]

{ #category : #initialization }
LabelImage >> initialize [
	imageSize := 224.
	inputMean := 128.0.
	inputStddev := 127.0.
	
	graphFile := '/tmp/mobilenet_v1_1.0_224_quant_frozen.pb'.
	imageFile := '/tmp/grace_hooper.jpg'.
	labelsFile := '/tmp/labels.txt'.
	
	top_n := 5.
]

{ #category : #accessing }
LabelImage >> inputMean [
	^ inputMean
]

{ #category : #accessing }
LabelImage >> inputMean: anObject [
	inputMean := anObject
]

{ #category : #accessing }
LabelImage >> inputStddev [
	^ inputStddev
]

{ #category : #accessing }
LabelImage >> inputStddev: anObject [
	inputStddev := anObject
]

{ #category : #accessing }
LabelImage >> inputValues [
	^ inputValues
]

{ #category : #accessing }
LabelImage >> inputValues: anObject [
	inputValues := anObject
]

{ #category : #accessing }
LabelImage >> labelsFile [
	^ labelsFile
]

{ #category : #accessing }
LabelImage >> labelsFile: anObject [
	labelsFile := anObject
]

{ #category : #run }
LabelImage >> predict [
	| results kv labels |
	
	results := (session 
					runInputs: {((graph operationAt: 1) output)}
					values: {inputValues}
					outputs: {((graph operationAt: (graph operationsCount)) output)}) first asNumbers first.
					
	labels := labelsFile asFileReference contents lines.
	
	kv := results collect: [ :each | Array with: (labels at: (results indexOf: each)) with: each ].
	
	^ (kv sort: [:k1 :k2 | (k1 at: 2) > (k2 at: 2)]) first: top_n
]

{ #category : #preparation }
LabelImage >> prepareImageInput [
	| scaledImage b1 b2 b3 array2D |
	scaledImage := (ImageReadWriter formFromFileNamed: '/tmp/grace_hopper.jpg') scaledIntoFormOfSize: imageSize.
	
	"bitmasks for R, G, and B"
	b1 := scaledImage rgbaBitMasks at: 1.
	b2 := scaledImage rgbaBitMasks at: 2.
	b3 := scaledImage rgbaBitMasks at: 3.

	array2D := Array2D new: imageSize.
	1 to: imageSize do: [:x|
		1 to: imageSize do: [:y|
			| p a |
			p := scaledImage pixelValueAt: x@y.
			a := Array 
				with: ((p & b1) bitShift: -16)
				with: ((p & b2) bitShift: -8)
				with: (p & b3)			
			.
			array2D at: y at: x put: a.
	 	]
	].

	inputValues := TF_Tensor fromFloats: ((array2D - inputMean) / inputStddev) shape: (Array with: 1 with: imageSize with: imageSize with: 3).
]

{ #category : #preparation }
LabelImage >> prepareSession [
	graph := TF_Graph fromBinaryFileNamed: graphFile.
	session := TF_Session on: graph.
]

{ #category : #accessing }
LabelImage >> top_n [
	^ top_n
]

{ #category : #accessing }
LabelImage >> top_n: anObject [
	top_n := anObject
]
