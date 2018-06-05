Class {
	#name : #BatchTrainer,
	#superclass : #Object,
	#instVars : [
		'plan',
		'batchSize',
		'imageSet',
		'labelSet',
		'imageTesting',
		'labelTesting'
	],
	#category : 'LibTensorFlow-Examples'
}

{ #category : #initialization }
BatchTrainer >> initialize [
	super initialize.
	batchSize := 100.
	imageSet := MNISTImageFile trainingSet.
	labelSet := MNISTLabelFile trainingSet.
	imageTesting := MNISTImageFile testSet.
	labelTesting := MNISTLabelFile testSet.
	self use3Layers
]

{ #category : #private }
BatchTrainer >> predict: images andCompareTo: labels [
	| equals result |
	result := (plan predict: images) asNumbers.
	equals := result
		with: labels
		collect: [ :x :y | 
			x = y
				ifTrue: [ 1 ]
				ifFalse: [ 0 ] ].
	^ equals mean asFloat
]

{ #category : #running }
BatchTrainer >> predictOnTesting [
	| images labels |
	images := imageTesting bytesAt: 1 take: imageTesting count.
	labels := labelTesting at: 1 take: labelTesting count.
	^ self predict: images andCompareTo: labels
]

{ #category : #running }
BatchTrainer >> predictOnTraining [
	| images labels |
	images := imageSet bytesAt: 1 take: 10 * batchSize.
	labels := labelSet at: 1 take: 10 * batchSize.
	^ self predict: images andCompareTo: labels
]

{ #category : #running }
BatchTrainer >> train [
	(1 to: labelSet count -1 by: batchSize) do: [:index| self trainAt: index].
]

{ #category : #private }
BatchTrainer >> trainAt: index [
	| images labels loss report result |
	images := imageSet bytesAt: index take: batchSize.
	labels := labelSet at: index take: batchSize.
	result := plan predict: images andLearnFrom: labels.
	loss := result at: 2.
	report := index asString, ': ', loss asNumbers asString.
	Transcript show: report;
					newLine
	
]

{ #category : #initialization }
BatchTrainer >> use3Layers [
	plan := MNIST3LayersNNExamplePlan new.
]

{ #category : #initialization }
BatchTrainer >> use3LayersSigmoid [
	plan := MNIST3LayersNNSigmoid new.
]

{ #category : #initialization }
BatchTrainer >> useSoftmax [
	plan := MNISTSoftMaxExamplePlan new.
]
