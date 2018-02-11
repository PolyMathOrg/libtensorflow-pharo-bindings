iterating
floatsDo: oneArgBlock
	self
		dataAndOffsetsCollect: [:data :offset | data floatAt: offset]
		thenDo: oneArgBlock.
