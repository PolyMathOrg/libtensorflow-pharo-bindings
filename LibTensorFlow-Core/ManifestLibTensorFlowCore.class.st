"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestLibTensorFlowCore,
	#superclass : #PackageManifest,
	#category : #'LibTensorFlow-Core-Manifest'
}

{ #category : #'code-critics' }
ManifestLibTensorFlowCore class >> ruleRTInvocationSequenceRuleV1FalsePositive [
	^ #(#(#(#RGPackage #(#'LibTensorFlow-Core')) #'2018-07-27T15:20:01.424584+01:00') )
]
