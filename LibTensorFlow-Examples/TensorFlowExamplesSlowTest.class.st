Class {
	#name : #TensorFlowExamplesSlowTest,
	#superclass : #TestCase,
	#instVars : [
		'images',
		'labels'
	],
	#category : 'LibTensorFlow-Examples'
}

{ #category : #accessing }
TensorFlowExamplesSlowTest class >> defaultTimeLimit [
	^ 5 minutes
]

{ #category : #initialization }
TensorFlowExamplesSlowTest >> setUp [
	| imageSet labelSet n |
	imageSet := MNISTImageFile testSet.
	labelSet := MNISTLabelFile testSet.
	n := 2.
	images := (1 to: n) collect: [ :i | imageSet bytesAt: i ].
	labels := (1 to: n) collect: [ :i | labelSet at: i ]
]

{ #category : #'testing - MNIST files' }
TensorFlowExamplesSlowTest >> testImages [
	| testing training |
	testing := MNISTImageFile testSet.
	training := MNISTImageFile trainingSet.
	
	self assert: testing count equals: 10000.
	self assert: training count equals: 60000.
	self assert: testing rows equals: 28.
	self assert: testing columns equals: 28.
	self assert: training rows equals: 28.
	self assert: training columns equals: 28.
	self assert: testing asTensor shape equals: {10000. 28*28}.
	self assert: training asTensor shape equals: {60000. 28*28}.
]

{ #category : #'testing - MNIST files' }
TensorFlowExamplesSlowTest >> testLabels [
	| test training |
	test := MNISTLabelFile testSet.
	training := MNISTLabelFile trainingSet.
	
	self assert: test count equals: 10000.
	self assert: training count equals: 60000.
]

{ #category : #'testing - MNIST - SoftMax' }
TensorFlowExamplesSlowTest >> testPrediction [
	| loss plan prediction result |
	plan := MNISTSoftMaxExamplePlan new.
	result := plan predict: images andCompareTo: labels.
	loss := (result at:2) asNumbers.
	self deny: (loss closeTo: 0).
	100 timesRepeat: [
		plan predict: images andLearnFrom: labels].
	result := plan predict: images andCompareTo: labels.
	loss := (result at:2) asNumbers.
	self assert: 0 closeTo: loss.
	prediction := plan predict: images.
	self assert: prediction asNumbers first equals: labels first.
	self assert: prediction asNumbers second equals: labels second
]

{ #category : #'testing - MNIST - 3Layers' }
TensorFlowExamplesSlowTest >> testPrediction3Layers [
	|   loss plan result prediction |
	plan := MNIST3LayersNNExamplePlan new.
	result := plan predict: images andCompareTo: labels.
	loss := (result at:2) allFloats.
	self deny: (loss first closeTo: 0).
	100 timesRepeat: [ |interval index im lb|
		interval := 1 to: images size.
		index := interval collect:[:i| interval atRandom].
		im := index collect:[:i| images at: i].
		lb := index collect:[:i| labels at: i].
		plan predict: im andLearnFrom: lb].
	result := plan predict: images andCompareTo: labels.
	loss := (result at:2) allFloats.
	self assert: (loss first closeTo: 0).
	prediction := plan predict: images.
	self assert: prediction asNumbers first equals: labels first.
	self assert: prediction asNumbers second equals: labels second
]

{ #category : #'testing - MNIST - 3Layers' }
TensorFlowExamplesSlowTest >> testPrediction3LayersSigmoid [
	|   loss plan result prediction |
	plan := MNIST3LayersNNSigmoid new.
	result := plan predict: images andCompareTo: labels.
	loss := (result at:2) allFloats.
	self deny: (loss first closeTo: 0).
	100 timesRepeat: [ |interval index im lb|
		interval := 1 to: images size.
		index := interval collect:[:i| interval atRandom].
		im := index collect:[:i| images at: i].
		lb := index collect:[:i| labels at: i].
		plan predict: im andLearnFrom: lb].
	result := plan predict: images andCompareTo: labels.
	loss := (result at:2) asNumbers.
	self assert: (loss < 1).
	prediction := plan predict: images.
	self assert: prediction asNumbers equals: labels.

]

{ #category : #'testing - MNIST - SoftMax' }
TensorFlowExamplesSlowTest >> testPredictionMany [
	| imageSet images labelSet labels loss plan result prediction n |
	n := 200.
	
	plan := MNISTSoftMaxExamplePlan new.
	imageSet := MNISTImageFile testSet.
	labelSet := MNISTLabelFile testSet.
	
	images := (1 to: n) collect: [:i | imageSet bytesAt: i].
	labels := (1 to: n) collect: [:i | labelSet at: i].
	
	result := plan predict: images andCompareTo: labels.
	loss := (result at:2) asNumbers.
	self deny: (loss closeTo: 0).
	100 timesRepeat: [
		plan predict: images andLearnFrom: labels].
	
	result := plan predict: images andCompareTo: labels.
	loss := (result at:2) asNumbers.
	self assert: (loss closeTo: 0).
	
	prediction := plan predict: images.
	self assert: prediction asNumbers equals: labels.

]

{ #category : #'testing - Regression' }
TensorFlowExamplesSlowTest >> testSinglePointRegression [
	| function loss net results rnd x y |
	net := RegressionNNExample new.
	function := RegressionNNExample exampleFunction.
	rnd := Random new.
	x := rnd next.
	y := function value: x.
	100 timesRepeat:[net predict: {{x}} andLearnFrom:{{y}}].
	results := net predict: {{x}} andCompareTo: {{y}}.
	loss := (results at: 2) asNumbers.
	self assert: loss first closeTo: 0.
	
]

{ #category : #'testing - Regression' }
TensorFlowExamplesSlowTest >> testTwoPointsRegression [
	| function loss net results  interval xs ys |
	net := RegressionNNExample new.
	function := RegressionNNExample exampleFunction.
	xs := {{0.1}. {0.6}}.
	ys := {{function value: xs first first}. 
			{function value: xs second first}}.
	interval := 1 to: xs size.
	1000 timesRepeat: [ |index |
		index := interval atRandom.
		net predict: {xs at: index} andLearnFrom:{ys at: index}].
	results := net predict: xs andCompareTo: ys.
	loss := (results at: 2) asNumbers.
	self assert: loss first closeTo: 0.
	
]
