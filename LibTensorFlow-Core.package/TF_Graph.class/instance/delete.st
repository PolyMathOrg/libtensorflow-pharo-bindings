initialize-release
delete
	self ignoreFinalization.
	self isNull
		ifFalse: [ self library deleteGraph: self ].
	handle := nil