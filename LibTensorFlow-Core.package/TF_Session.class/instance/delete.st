release
delete
	| status |
	self ignoreFinalization.
	self isNull ifFalse: [
		self close.
		status := TF_Status create.
		self library
			deleteSession: self
			status: status.
		status check.
	].
	handle := nil.
