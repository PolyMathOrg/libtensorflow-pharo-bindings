converting
asOperationOn: aTF_Graph
	graph == aTF_Graph
		ifTrue: [^ self]
		ifFalse: [^ self error: 'Can''t move an operation to another Graph']