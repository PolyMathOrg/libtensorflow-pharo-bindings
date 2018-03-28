utils
version
	"TF_Version returns a string describing version information of the
	TensorFlow library. TensorFlow using semantic versioning."

	"<cdecl: char* 'TF_Version' (void)>"

	^ self ffiCall: #(String TF_Version #()) module: 'libtensorflow.dylib'