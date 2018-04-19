operation
graph: aTF_Graph operationAt: contextULongLongPtr
	| answer |
	answer := self graph: aTF_Graph operationAtAsVoid: contextULongLongPtr.
	answer graph: aTF_Graph.
	^ answer