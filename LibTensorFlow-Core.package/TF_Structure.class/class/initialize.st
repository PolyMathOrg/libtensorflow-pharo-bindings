class initialization
initialize
	super initialize.
	self == TF_Structure
		ifTrue: [ self allSubclassesDo: [ :cls | cls initialize ].
			self allSubclassesDo: [ :cls | cls initialize ] ]