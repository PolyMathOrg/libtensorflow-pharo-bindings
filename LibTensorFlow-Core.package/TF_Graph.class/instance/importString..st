initialize-release
importString: aString
	| buffer |
	buffer := TF_Buffer fromString: aString.
	[self import: buffer] ensure: ["buffer delete"].