testing graph
testSessionDeletionDoesntDeleteGraphs
	| session graph allocatedObjects |
	graph := TF_Graph create.
	session := TF_Session on: graph.
	session ignoreFinalization.
	session close.
	session delete.

	" Allocate some external objects using the library, if the graph was released, we expect its space to be reused "
	allocatedObjects := OrderedCollection new: 10.
	10 timesRepeat: [ allocatedObjects add: TF_Status create ].
	self
		shouldnt: [ graph placeholder: 'a' type: TF_Tensor typeInt64 ]
		raise: Error
		description: 'The FFI call would crash if the graph was released by deleting the session'