instance creation
fromFileNamed: aString
	| fileContents |
	fileContents := aString asFileReference readStream contents.
	^ self fromString: fileContents