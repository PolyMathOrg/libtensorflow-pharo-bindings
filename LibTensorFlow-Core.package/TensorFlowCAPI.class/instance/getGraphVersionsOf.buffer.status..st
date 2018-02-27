graph
getGraphVersionsOf: aTF_Graph buffer: aTF_Buffer status: aTF_Status
	"// Returns the serialized VersionDef proto for this graph.
TF_CAPI_EXPORT extern void TF_GraphVersions(TF_Graph* graph,
                                            TF_Buffer* output_version_def, TF_Status* status);"

	^ self ffiCall: #(void TF_GraphVersions #(TF_Graph * aTF_Graph , TF_Buffer * aTF_Buffer , TF_Status * aTF_Status)) module: 'libtensorflow.dylib'