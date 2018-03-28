testing graph
testWriteDefTo
	| graph stream |
	graph := self constantInt64GraphFromDef.
	stream := WriteStream on: String new.
	graph writeDefTo: stream.
	self assert: stream contents size equals: self constantInt64GraphDef size