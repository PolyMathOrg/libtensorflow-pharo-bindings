initialize-release
delete
self halt.
	self ignoreFinalization.
	self isNull
		ifFalse: [ self library deleteStatus: self ].
	handle := nil