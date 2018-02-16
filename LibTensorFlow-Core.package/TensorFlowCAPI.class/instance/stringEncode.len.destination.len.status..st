strings
stringEncode: srcString len: srcLen destination: dstString len: dstLen status: status
	"<cdecl: ulonglong 'TF_StringEncode' (char* ulonglong char* ulonglong TF_Status)>"

	^ self
		ffiCall:
			#(ulonglong TF_StringEncode #(String srcString , ulonglong srcLen , String dstString , ulonglong dstLen, TF_Status * status))
		module: 'libtensorflow.dylib'