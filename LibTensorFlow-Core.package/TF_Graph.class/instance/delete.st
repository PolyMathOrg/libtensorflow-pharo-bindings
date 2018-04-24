initialize-release
delete
self halt.
	self ignoreFinalization.
	self isNull
		ifFalse: [ self library deleteGraph: self ].
	handle := nil