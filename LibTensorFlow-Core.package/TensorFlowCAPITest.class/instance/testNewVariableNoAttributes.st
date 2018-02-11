testing operation
testNewVariableNoAttributes
	| graph error |
	graph := TF_Graph create.
	error :=  'INVALID_ARGUMENT: NodeDef missing attrs ''dtype'', ''shape'' from Op<name=Variable; signature= -> ref:Ref(dtype); attr=shape:shape; attr=dtype:type; attr=container:string,default=""; attr=shared_name:string,default=""; is_stateful=true>; NodeDef: var = Variable[_class=[], container="", shared_name=""]()'.
	self
		should: [graph newOperation: 'Variable' named: 'var']
		raiseError: error.