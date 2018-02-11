testing graph
testNewGraph
	| graph |
	graph := TF_Graph create.
	self deny: graph isNull.
	graph delete.
	self assert: graph isNull