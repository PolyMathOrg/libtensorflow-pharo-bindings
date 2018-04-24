instance creation
finalizeResourceData: handle
	handle isNull ifTrue: [ ^ self ].
	"We also need to delete the graph from memory. This is not done at the moment"
	"self library deleteGraph: handle."
	handle free.
	handle beNull