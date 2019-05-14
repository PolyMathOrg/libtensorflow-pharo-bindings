"
This example shows how you can load a pre-trained TensorFlow network and use it to recognize objects in images.

Before using it, you have to prepare
  * graphFile: a TensorFlow GraphDef that contains the model definition and weights,
    default is '/tmp/mobilenet_v1_1.0_224_quant_frozen.pb'.
  * imageFile: the image/photo file to be recognized, default is '/tmp/grace_hooper.jpg'.
  * labelsFile: results of the classification is an array of probabilities for each
    category, it need a file of labels for each category to map numbers to categories,
    default is '/tmp/labels.txt'.

How to get them:
```
curl http://download.tensorflow.org/models/mobilenet_v1_2018_02_22/mobilenet_v1_1.0_224_quant.tgz | tar xzv -C /tmp
curl https://raw.githubusercontent.com/tensorflow/tensorflow/master/tensorflow/lite/examples/label_image/testdata/grace_hopper.bmp > /tmp/grace_hopper.bmp
curl https://storage.googleapis.com/download.tensorflow.org/models/mobilenet_v1_1.0_224_frozen.tgz  | tar xzv -C /tmp  mobilenet_v1_1.0_224/labels.txt
mv /tmp/mobilenet_v1_1.0_224/labels.txt /tmp/
```

Simplest example:
```
|results|
results := LabelImage new prepareImageInput;
	prepareSession;
	predict.
```
You can inspect the results to see the following:
```
#('653:military uniform' 0.842427134513855)
#('668:mortarboard' 0.04237252101302147)
#('907:Windsor tie' 0.035887911915779114)
#('820:stage' 0.011220086365938187)
#('820:stage' 0.011220086365938187)
```

To run Inception V3 like what described at https://github.com/tensorflow/tensorflow/tree/master/tensorflow/examples/label_image/README.md,
```
curl -L ""https://storage.googleapis.com/download.tensorflow.org/models/inception_v3_2016_08_28_frozen.pb.tar.gz"" | tar -C /tmp/ -xz
```

Then, run 
```
|results|
results := LabelImage new
	imageSize: 299;
	inputMean: 0.0;
	inputStddev: 255.0;
	graphFile: '/tmp/inception_v3_2016_08_28_frozen.pb';
	prepareImageInput;
	prepareSession;
	predict.

Transcript cr.
results do: [ :each|
	Transcript show: each;cr].
```
"
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
LabelImage >> imageSize: aNumber [
	imageSize := aNumber
]

{ #category : #initialization }
LabelImage >> initialize [
	imageSize := 224.
	inputMean := 128.0.
	inputStddev := 127.0.
	graphFile := '/tmp/mobilenet_v1_1.0_224_quant_frozen.pb'.
	imageFile := '/tmp/grace_hopper.jpg'.
	labelsFile := '/tmp/labels.txt'.
	top_n := 5
]

{ #category : #accessing }
LabelImage >> inputMean [
	^ inputMean
]

{ #category : #accessing }
LabelImage >> inputMean: aFloat [
	inputMean := aFloat
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
LabelImage >> labelsFile: aString [
	labelsFile := aString
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
	scaledImage := (ImageReadWriter
		formFromFileNamed: self imageFile)
		scaledIntoFormOfSize: imageSize.

	"bitmasks for R, G, and B"
	b1 := scaledImage rgbaBitMasks at: 1.
	b2 := scaledImage rgbaBitMasks at: 2.
	b3 := scaledImage rgbaBitMasks at: 3.
	array2D := Array2D new: imageSize.
	1 to: imageSize do: [ :x | 
		1 to: imageSize do: [ :y | 
			| p a |
			p := scaledImage pixelValueAt: x @ y.
			a := Array
				with: (p & b1 bitShift: -16)
				with: (p & b2 bitShift: -8)
				with: p & b3.
			array2D at: y at: x put: a ] ].
	inputValues := TF_Tensor
		fromFloats: (array2D - inputMean) / inputStddev
		shape:
			(Array
				with: 1
				with: imageSize
				with: imageSize
				with: 3)
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
