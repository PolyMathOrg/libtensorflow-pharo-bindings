field definition
fieldsDesc
	"self rebuildFieldAccessors"
	
	"typedef struct TF_Buffer {
  		const void* data;
  		size_t length;
  		void (*data_deallocator)(void* data, size_t length);
		} TF_Buffer;"
	^#(
	void * data;
	size_t length;
	void * deallocator;
	)