Class {
	#name : #ExamplePlan,
	#superclass : #Object,
	#instVars : [
		'graph',
		'inputs',
		'outputs',
		'session'
	],
	#category : 'LibTensorFlow-Examples'
}

{ #category : #initialization }
ExamplePlan >> initialize [
	self initializeGraph.
	self initializeSession.
]

{ #category : #initialization }
ExamplePlan >> initializeGraph [
	graph := TF_Graph create
	
]

{ #category : #initialization }
ExamplePlan >> initializeSession [
	session := TF_Session on: graph.
	graph initializeOn: session.

]

{ #category : #running }
ExamplePlan >> runOn: inputValues [
	| results |	
	results := session
		runInputs: inputs
		values: inputValues
		outputs: outputs.
		
	^ results first
	
]
