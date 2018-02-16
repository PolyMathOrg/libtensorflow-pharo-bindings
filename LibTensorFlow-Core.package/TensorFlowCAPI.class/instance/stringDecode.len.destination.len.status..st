strings
stringDecode: srcString len: srcLen destination: dstPointer len: dstLenPointer status: status
	"<cdecl: ulonglong 'TF_StringDecode' (char* ulonglong char* ulonglong* TF_Status)>"

	^ self
		ffiCall:
			#(ulonglong TF_StringDecode #(String srcString , ulonglong srcLen , String dstPointer , ulonglong * dstLenPointer, TF_Status * status))
		module: 'libtensorflow.dylib'