testing operation
testNewOperationPlaceholderNoType
	| graph noType |
	noType := 'INVALID_ARGUMENT: NodeDef missing attr ''dtype'' from Op<name=Placeholder; signature= -> output:dtype; attr=dtype:type; attr=shape:shape,default=<unknown>>; NodeDef: placeholder = Placeholder[shape=<unknown>]()'.
	graph := TF_Graph create.
	self
		should: [(graph newOperationDescription: 'Placeholder' named: 'placeholder') finish]
		raiseError: noType.