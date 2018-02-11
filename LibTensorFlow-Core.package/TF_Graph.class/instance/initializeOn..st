running
initializeOn: aTF_Session
	| initializers |
	initializers := self allInitializers collect: [ :each | each output: 0 ].
	initializers isNotEmpty
		ifTrue: [ aTF_Session runOutputs: initializers ]