Class {
	#name : #SimpleNeuralNetworkExample,
	#superclass : #Object,
	#instVars : [
		'forward',
		'backward',
		'weights'
	],
	#category : 'LibTensorFlow-Examples'
}

{ #category : #accessing }
SimpleNeuralNetworkExample >> initialWeights: aCollection [
	weights := aCollection asFloatTensor
]

{ #category : #initialization }
SimpleNeuralNetworkExample >> initialize [
	forward := BackpropagationForwardPlan new.
	backward := BackpropagationBackwardPlan new.
]

{ #category : #learning }
SimpleNeuralNetworkExample >> learn: sample with: expected [
		| result |
	result := forward runOn: {sample. weights}.
	weights := backward runOn: {sample. weights. expected. result}.
]

{ #category : #learning }
SimpleNeuralNetworkExample >> learnAll: samples to: targets steps: n [
	n timesRepeat: [
		samples with: targets do:[:sample :target| self learn: sample with: target]
		]
]

{ #category : #service }
SimpleNeuralNetworkExample >> predict: sample [
		| result |
	result := forward runOn: {sample. weights}.
	^ result allFloats 
]
