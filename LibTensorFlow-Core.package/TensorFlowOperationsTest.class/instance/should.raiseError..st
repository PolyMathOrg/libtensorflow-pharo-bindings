initialization
should: aBlock raiseError: aString
	| message |
	message := 'No Error was signaled'.
	aBlock ifError: [ :description :receiver | message := description ].
	self assert: 'Error: ' , aString equals: message