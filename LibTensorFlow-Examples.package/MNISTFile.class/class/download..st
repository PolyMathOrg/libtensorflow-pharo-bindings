private
download: aName	
	| url response content file |
		url := 'http://yann.lecun.com/exdb/mnist/', aName.
		response := ZnClient new get: url.
		content := response asByteArray.
		file := ('dataset/', name) asFileReference.
		"file < content."
		^ file