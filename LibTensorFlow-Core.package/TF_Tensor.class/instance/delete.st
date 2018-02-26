release
delete
	self ignoreFinalization.
	self isNull
		ifFalse: [ self library deleteTensor: self ].
	handle := nil