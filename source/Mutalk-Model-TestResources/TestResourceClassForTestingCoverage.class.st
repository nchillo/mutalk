Class {
	#name : #TestResourceClassForTestingCoverage,
	#superclass : #TestResource,
	#category : #'Mutalk-Model-TestResources'
}

{ #category : #'as yet unclassified' }
TestResourceClassForTestingCoverage >> doSomething [
	^ClassForTestingCoverage new anUncoveredMethod.
]

{ #category : #'as yet unclassified' }
TestResourceClassForTestingCoverage >> setUp [
	self doSomething
]
