ops binary
castTo: typeInteger
	^ self unaryOp: 'Cast' described: [ :description | description at: 'DstT' putType: typeInteger ]