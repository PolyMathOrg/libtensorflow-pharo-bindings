initialize-release
importFileNamed: aString
	| buffer |
	buffer := TF_Buffer fromFileNamed: aString.
	[self import: buffer] ensure: [buffer delete].