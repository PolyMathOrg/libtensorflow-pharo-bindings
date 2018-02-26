iterating
int32sDo: oneArgBlock
	self dataAndOffsetsCollect: [ :data :offset | data signedLongAt: offset ] thenDo: oneArgBlock