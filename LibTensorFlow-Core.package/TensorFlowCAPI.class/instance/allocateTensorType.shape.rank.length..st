tensor
allocateTensorType: anInteger shape: aLongLongArray rank: dimCount length: len
	"<cdecl: TF_Tensor* 'TF_AllocateTensor' (ulong UInt64Array* ulonglong ulonglong)>"

	^ self
		ffiCall: #(
		TF_Tensor * TF_AllocateTensor #(
			long anInteger,
			Int64Array * aLongLongArray,
			long dimCount,
			size_t len))
		module: 'libtensorflow.dylib'