sampling
testingAndTrainingFrom: stream
	| p random testing training lines |
	lines := stream upToEnd lines.
	p := 0.7.
	training := OrderedCollection new.
	testing := OrderedCollection new.
	random := Random new.
	lines collect: [ :line | | collection |
		line isEmpty ifFalse: [
			collection := random next < p
				ifTrue: [ training ]
				ifFalse: [ testing ].
			collection add: line ]].
	^ {training. testing}.