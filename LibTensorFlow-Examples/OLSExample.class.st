Class {
	#name : #OLSExample,
	#superclass : #Object,
	#instVars : [
		'plan'
	],
	#category : 'LibTensorFlow-Examples'
}

{ #category : #initialization }
OLSExample >> initialize [
	plan := ExampleOLSPlan new.
]

{ #category : #initialization }
OLSExample >> initializeWithOperations [
	plan := ExampleOLSPlan new initializeGraphWithOperations initializeSession
]

{ #category : #running }
OLSExample >> regress: x on: y [
	| result |
	result := plan runOn: {x. y}.
	^ result allFloats
]
