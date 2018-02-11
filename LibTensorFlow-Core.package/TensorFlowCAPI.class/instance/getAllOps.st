utils
getAllOps
	"<cdecl: TF_Buffer* 'TF_GetAllOpList' (void)>"

	^ self ffiCall: #(TFBuffer * TF_GetAllOpList #()) module: 'libtensorflow.dylib'