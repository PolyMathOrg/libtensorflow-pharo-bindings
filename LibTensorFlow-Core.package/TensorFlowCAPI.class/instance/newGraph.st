instance creation
newGraph
	| answer |
	answer := self newGraphAsVoid.
	answer := TF_Graph fromHandle: answer getHandle.
	^ answer