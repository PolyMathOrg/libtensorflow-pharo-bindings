Class {
	#name : #BaselineOfLibTensorFlowPharoBinding,
	#superclass : #BaselineOf,
	#category : #BaselineOfLibTensorFlowPharoBinding
}

{ #category : #baseline }
BaselineOfLibTensorFlowPharoBinding >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			"Dependencies"
			self
				idxReader: spec;
				roassal2: spec.

			"Packages"
			spec
				package: 'LibTensorFlow-Core' with: [ spec requires: #(IdxReader) ];
				package: 'LibTensorFlow-Examples' with: [ spec requires: #('LibTensorFlow-Core' 'Roassal2') ].

			"Groups"
			spec
				group: 'Core' with: #('LibTensorFlow-Core');
				group: 'Examples' with: #('LibTensorFlow-Examples') ]
]

{ #category : #baseline }
BaselineOfLibTensorFlowPharoBinding >> idxReader: spec [
	spec baseline: 'IdxReader' with: [ spec repository: 'github://guillep/idx-reader' ]
]

{ #category : #baseline }
BaselineOfLibTensorFlowPharoBinding >> roassal2: spec [
	spec baseline: 'Roassal2' with: [ spec repository: 'github://ObjectProfile/Roassal2/src' ]
]
