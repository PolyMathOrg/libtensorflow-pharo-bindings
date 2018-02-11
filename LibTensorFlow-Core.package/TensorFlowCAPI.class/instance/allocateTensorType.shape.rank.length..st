tensor
allocateTensorType: anInteger shape: aLongLongArray rank: dimCount length: len
	"<cdecl: TF_Tensor* 'TF_AllocateTensor' (ulong UInt64Array* ulonglong ulonglong)>"

	^ self
		ffiCall: #(
		TF_Tensor * TF_AllocateTensor #(
			uint64 anInteger,
			uint64 * aLongLongArray,
			uint64 dimCount,
			uint64 len))
		module: 'libtensorflow.dylib'