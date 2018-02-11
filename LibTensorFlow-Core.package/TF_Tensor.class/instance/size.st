accessing
size
	^ self shape inject: 1 into: [ :prev :next | prev * next ]