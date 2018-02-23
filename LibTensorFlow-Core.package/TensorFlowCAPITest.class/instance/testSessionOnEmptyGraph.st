testing session
testSessionOnEmptyGraph
	| session |
	session := TF_Session on: self emptyGraph.
	self halt.
	self should: [ session run ] raiseError: 'INVALID_ARGUMENT: Must specify at least one target to fetch or execute.'