strings
primStringEncodedSize: anInteger
	"<cdecl: ulonglong 'TF_StringEncodedSize' (ulonglong)>"

	^ self ffiCall: #(size_t TF_StringEncodedSize #(size_t anInteger)) module: 'libtensorflow.dylib'