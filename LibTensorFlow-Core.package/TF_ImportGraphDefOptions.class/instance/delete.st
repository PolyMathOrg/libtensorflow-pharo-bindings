release
delete
	self isNull
		ifFalse: [ self library deleteImportGraphDefOptions: self ].
	handle := nil