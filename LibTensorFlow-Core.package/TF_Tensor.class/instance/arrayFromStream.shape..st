converting
arrayFromStream: strm shape: shape
	^ shape isEmpty
		ifTrue: [strm next]
		ifFalse: [
			| first tail |
			first := shape first.
			tail := shape allButFirst.
			Array
				streamContents: [:answer |
					first timesRepeat: [
						| next |
						next := self arrayFromStream: strm shape: tail.
						answer nextPut: next]]
				estimatedSize: first]
				
