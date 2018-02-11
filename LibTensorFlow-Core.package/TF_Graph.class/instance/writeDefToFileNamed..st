debugging
writeDefToFileNamed: filename
	filename asFileReference writeStreamDo: [ :strm | self writeDefTo: strm ]