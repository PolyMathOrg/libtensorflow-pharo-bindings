testing tensor
testGet2x2FloatFromGraphDef
	| templates consts |
	templates := #(-1.1 -2.1 -1.2 -2.2).
	consts := self get2x2FloatFromGraphDef allFloats.
	
	templates with: consts do: [:temp :const |
		self assert: (temp closeTo: const)]