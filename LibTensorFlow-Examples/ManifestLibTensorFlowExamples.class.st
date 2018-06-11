"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestLibTensorFlowExamples,
	#superclass : #PackageManifest,
	#category : #'LibTensorFlow-Examples'
}

{ #category : #'code-critics' }
ManifestLibTensorFlowExamples class >> ruleRTInvocationSequenceRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#TensorFlowExamplesSlowTest)) #'2018-06-11T14:41:47.479012+01:00') )
]
