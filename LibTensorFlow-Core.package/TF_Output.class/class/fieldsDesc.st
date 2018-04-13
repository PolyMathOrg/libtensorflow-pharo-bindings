field definition
fieldsDesc
	"self rebuildFieldAccessors"

	"typedef struct TF_Output {
  		TF_Operation* oper;
  		int index;  // The index of the output within oper.
	} TF_Output;"

	^ #(
		TF_Operation * operation ;
		longlong index ;)