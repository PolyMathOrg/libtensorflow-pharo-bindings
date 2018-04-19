strings
stringDecode: srcString len: srcLen destination: dstPointer len: dstLenPointer status: status
	"TF_CAPI_EXPORT extern size_t TF_StringDecode(const char* src, size_t src_len,
                                             const char** dst, size_t* dst_len,
TF_Status* status);"

	^ self
		ffiCall:
			#(size_t TF_StringDecode #(String srcString , size_t srcLen , String dstPointer , size_t * dstLenPointer, TF_Status * status))
		module: TensorFlowCAPI