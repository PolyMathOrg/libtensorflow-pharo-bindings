instance creation
onOperation: aTF_Operation index: anInteger
	^ self externalNew
		operation: aTF_Operation getHandle;
		index: anInteger;
		yourself