strings
stringEncode: srcString len: srcLen destination: dstString len: dstLen status: status
	"TF_CAPI_EXPORT extern size_t TF_StringEncode(const char* src, size_t src_len,
                                             char* dst, size_t dst_len,
													TF_Status* status);"

	^ self
		ffiCall:
			#(size_t TF_StringEncode #(String srcString , size_t srcLen , String dstString , size_t dstLen, TF_Status * status))
		module: 'libtensorflow.dylib'