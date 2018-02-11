accessing
operationOn: aTF_Graph
	| answer |
	answer := TF_Operation fromHandle: (handle longPointerAt: 1).
	answer graph: aTF_Graph.
	^ answer