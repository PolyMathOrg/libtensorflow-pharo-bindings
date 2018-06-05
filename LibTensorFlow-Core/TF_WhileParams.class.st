Class {
	#name : #'TF_WhileParams',
	#superclass : #'TF_Structure',
	#classVars : [
		'OFFSET_BODY_GRAPH',
		'OFFSET_BODY_INPUTS',
		'OFFSET_BODY_OUTPUTS',
		'OFFSET_COND_GRAPH',
		'OFFSET_COND_INPUTS',
		'OFFSET_COND_OUTPUT',
		'OFFSET_NAME',
		'OFFSET_NINPUTS'
	],
	#category : 'LibTensorFlow-Core'
}

{ #category : #'field definition' }
TF_WhileParams class >> fieldsDesc [
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
]

{ #category : #'accessing structure variables' }
TF_WhileParams >> body_graph [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_BODY_GRAPH) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
TF_WhileParams >> body_graph: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_BODY_GRAPH put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
TF_WhileParams >> body_inputs [
	"This method was automatically generated"
	^TF_Output fromHandle: (handle pointerAt: OFFSET_BODY_INPUTS)
]

{ #category : #'accessing structure variables' }
TF_WhileParams >> body_inputs: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_BODY_INPUTS put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
TF_WhileParams >> body_outputs [
	"This method was automatically generated"
	^TF_Output fromHandle: (handle pointerAt: OFFSET_BODY_OUTPUTS)
]

{ #category : #'accessing structure variables' }
TF_WhileParams >> body_outputs: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_BODY_OUTPUTS put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
TF_WhileParams >> cond_graph [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_COND_GRAPH) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
TF_WhileParams >> cond_graph: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_COND_GRAPH put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
TF_WhileParams >> cond_inputs [
	"This method was automatically generated"
	^TF_Output fromHandle: (handle pointerAt: OFFSET_COND_INPUTS)
]

{ #category : #'accessing structure variables' }
TF_WhileParams >> cond_inputs: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_COND_INPUTS put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
TF_WhileParams >> cond_output [
	"This method was automatically generated"
	^ TF_Output fromHandle: (handle referenceStructAt: OFFSET_COND_OUTPUT length: TF_Output byteSize)
]

{ #category : #'accessing structure variables' }
TF_WhileParams >> cond_output: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_COND_OUTPUT put: anObject getHandle length: TF_Output byteSize
]

{ #category : #'accessing structure variables' }
TF_WhileParams >> name [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_NAME) type: ExternalType char asPointerType
]

{ #category : #'accessing structure variables' }
TF_WhileParams >> name: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_NAME put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
TF_WhileParams >> ninputs [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NINPUTS
]

{ #category : #'accessing structure variables' }
TF_WhileParams >> ninputs: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NINPUTS put: anObject
]
