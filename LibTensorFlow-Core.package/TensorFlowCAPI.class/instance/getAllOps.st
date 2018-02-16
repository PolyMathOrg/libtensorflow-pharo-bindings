utils
getAllOps
	"<cdecl: TF_Buffer* 'TF_GetAllOpList' (void)>"

	^ self ffiCall: #(TF_Buffer * TF_GetAllOpList #()) module: 'libtensorflow.dylib'