initialize-release
delete
	self ignoreFinalization.
	self isNull ifFalse: [
		self library deleteSessionOptions: self].
	handle := nil