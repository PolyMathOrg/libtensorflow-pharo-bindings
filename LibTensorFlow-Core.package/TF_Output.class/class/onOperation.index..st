instance creation
onOperation: aTF_Operation index: anInteger
	^ self externalNew
		operation: aTF_Operation;
		index: anInteger;
		yourself