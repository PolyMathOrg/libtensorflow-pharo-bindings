iterating
int64sDo: oneArgBlock
	self dataAndOffsetsCollect: [ :data :offset | data signedLongLongAt: offset ] thenDo: oneArgBlock