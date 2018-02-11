testing graph
testWriteDefTo
	| graph strm |
	graph := self constantInt64GraphFromDef.
	strm := WriteStream on: String new.
	graph writeDefTo: strm.
	self assert: self constantInt64GraphDef size equals: strm contents size