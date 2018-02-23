initialize-release
importString: aString
	| buffer |
	buffer := TF_Buffer fromString: aString.
	[self halt.
	self import: buffer] ensure: ["buffer delete"].