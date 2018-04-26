instance creation
type: anInteger shape: anIntegerArray bytesize: bytesizeInteger
	" I understand dimensions are:
		#()		-> Scalar
		#(7)		-> Unidimensional array of 7 elements
		#(7 4)		-> 7x4 elements matrix
		#(2 5 9)	-> 2x5x9 elements cube
		etc.
	"
		
	| externalized answer |
	
	externalized := FFIExternalArray externalNewType: 'int64' fromArray: anIntegerArray.
	
	answer := TensorFlowCAPI current
		allocateTensorType: anInteger
		shape: externalized getHandle
		rank: anIntegerArray size
		length: bytesizeInteger.
	answer autoRelease.
	^ answer
