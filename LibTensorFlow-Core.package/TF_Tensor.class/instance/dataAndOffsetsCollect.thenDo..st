iterating
dataAndOffsetsCollect: twoArgsBlock thenDo: oneArgBlock
	| data elementSize |
	elementSize := self elementSize.
	data := self data getHandle.
	1 to: self size do: [:i |
		| value |
		value := twoArgsBlock value: data value: i-1*elementSize+1.
		oneArgBlock value: value].
