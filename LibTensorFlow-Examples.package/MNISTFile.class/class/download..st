private
download: name
		| url response content file |
		url := 'http://yann.lecun.com/exdb/mnist/', name.
		response := HTTPClient httpGet: url.
		content := response content asByteArray.
		file := ('dataset/', name) asFileEntry.
		file < content.
		^ file