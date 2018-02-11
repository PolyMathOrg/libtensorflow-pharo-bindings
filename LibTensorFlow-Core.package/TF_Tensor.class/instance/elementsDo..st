iterating
elementsDo: oneArgBlock
	self
		dataAndOffsetsCollect: self getterBlock
		thenDo: oneArgBlock.
