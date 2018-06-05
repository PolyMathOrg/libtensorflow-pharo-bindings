Extension { #name : #TestCase }

{ #category : #'*LibTensorFlow-Core' }
TestCase >> assert: expected closeTo: actual [
	self assert: (expected closeTo: actual) description: (self comparingStringBetween: expected and: actual)
]
