field definition
fieldsDesc
	"self rebuildFieldAccessors"
	
	"typedef struct TF_WhileParams {
  // The number of inputs to the while loop, i.e. the number of loop variables.
  // This is the size of cond_inputs, body_inputs, and body_outputs.
  const int ninputs;

  // The while condition graph. The inputs are the current values of the loop
  // variables. The output should be a scalar boolean.
  TF_Graph* const cond_graph;
  const TF_Output* const cond_inputs;
  TF_Output cond_output;

  // The loop body graph. The inputs are the current values of the loop
  // variables. The outputs are the updated values of the loop variables.
  TF_Graph* const body_graph;
  const TF_Output* const body_inputs;
  TF_Output* const body_outputs;

  // Unique null-terminated name for this while loop. This is used as a prefix
  // for created operations.
  const char* name;
} TF_WhileParams;"
	^#(
	int ninputs;
	TF_Graph * cond_graph;
	TF_Output * cond_inputs;
	TF_Output cond_output;
	TF_Graph * body_graph;
	TF_Output * body_inputs;
	TF_Output * body_outputs;
	char * name;
	)