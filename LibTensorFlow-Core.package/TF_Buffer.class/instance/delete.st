release
delete
	self isNull
		ifFalse: [ self library deleteBuffer: self ].
	handle := nil