operation
graph: aTF_Graph operationAt: contextULongLongPtr
	| answer |
	answer := self graph: aTF_Graph operationAtAsVoid: contextULongLongPtr.
	answer handle: answer getHandle getHandle.
	answer graph: aTF_Graph.
	^ answer