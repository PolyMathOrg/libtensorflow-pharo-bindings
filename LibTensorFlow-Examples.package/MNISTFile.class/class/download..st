private
download: aName	
	| url response content file |
		url := 'http://yann.lecun.com/exdb/mnist/', aName.
		response := ZnClient new get: url.
		content := response asByteArray.
		(FileSystem disk workingDirectory fileSystem) createDirectory: 'dataset'.
		file := ('dataset/', name) asFileReference.
		file writeStreamDo: [ :stream | 
    stream 
         nextPutAll: content ].
		^ file