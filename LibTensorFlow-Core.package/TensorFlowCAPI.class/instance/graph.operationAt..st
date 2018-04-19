operation
graph: aTF_Graph operationAt: contextULongLongPtr
	| answer |
	answer := self graph: aTF_Graph operationAtAsVoid: contextULongLongPtr.
	answer := TF_Operation fromHandle: answer getHandle getHandle.
	"why double getHandle ?"
	answer graph: aTF_Graph.
	^ answer