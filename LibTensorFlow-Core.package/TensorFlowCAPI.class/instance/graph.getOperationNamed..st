graph
graph: aTF_Graph getOperationNamed: aString
	| answer |
	answer := self graph: aTF_Graph getOperationNamedAsVoid: aString.
	answer := TF_Operation fromHandle: answer getHandle.
	answer graph: aTF_Graph.
	^ answer