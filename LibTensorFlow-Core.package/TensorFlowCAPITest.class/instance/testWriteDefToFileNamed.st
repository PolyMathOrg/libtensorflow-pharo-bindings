testing graph
testWriteDefToFileNamed
	| graph filename filedata |
	filename := 'temporaryGraph.pb'.
	graph := self constantInt64GraphFromDef.
	graph writeDefToFileNamed: filename.
	filedata := filename asFileReference readStream upToEnd.
	filename asFileReference delete.
	self assert: self constantInt64GraphDef size equals: filedata size