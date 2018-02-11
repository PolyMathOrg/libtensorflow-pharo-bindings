initialize-release
delete
	self ignoreFinalization.
	self isNull
		ifFalse: [ self library deleteStatus: self ].
	handle := nil