instance creation
fromFile: aString
	| file filename stream compressed|
	filename := aString, '.gz'.
	file := ('dataset/', filename) asFileEntry.
	file exists ifFalse:[ file := self download: filename].
	compressed := file readStream contentsOfEntireFile.
	stream := (GZipReadStream on: compressed) upToEnd asByteArray readStream.
	^ self fromStream: stream
	