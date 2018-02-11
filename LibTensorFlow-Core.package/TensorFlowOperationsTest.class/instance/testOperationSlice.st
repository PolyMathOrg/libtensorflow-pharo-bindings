other operations
testOperationSlice
	| m3x3 |
	m3x3 := #(	"shape: (3 1 3)"
		((1 2 3))
		((4 5 6))
		((7 8 9))
	).
	self assertSlice: #(1 2 3 4 5 6 7) from: #(0) size: #(1) is: #(1).
	self assertSlice: m3x3 from: #(0 0 0) size: #(1 1 1) is: #(((1))).
	self assertSlice: m3x3 from: #(1 0 1) size: #(1 1 1) is: #(((5))).
	self assertSlice: m3x3 from: #(1 0 1) size: #(1 -1 1) is: #(((5))).
	self assertSlice: m3x3 from: #(1 0 1) size: #(1 1 -1) is: #(((5 6))).
	self assertSlice: m3x3 from: #(1 0 1) size: #(1 -1 -1) is: #(((5 6))).
	self assertSlice: m3x3 from: #(1 0 1) size: #(-1 1 -1) is: #(((5 6)) ((8 9))).
