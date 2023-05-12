"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestIngSoft2Model,
	#superclass : #PackageManifest,
	#category : #'IngSoft2-Model-Manifest'
}

{ #category : #'code-critics' }
ManifestIngSoft2Model class >> ruleModifiesCollectionRuleV1FalsePositive [
	^ #(#(#(#RGPackageDefinition #(#'IngSoft2-Model')) #'2023-05-12T13:18:32.079-03:00') )
]
