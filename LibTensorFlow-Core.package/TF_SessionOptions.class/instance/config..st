initialize-release
config: aString
	| status |
	status := TF_Status create.
	self library sessionOptions: self setConfig: aString configSize: aString size status: status.
	status check