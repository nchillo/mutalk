Class {
	#name : #MutationTestCaseResource,
	#superclass : #TestCase,
	#category : #'Mutalk-Model-TestResources'
}

{ #category : #accessing }
MutationTestCaseResource class >> packageNamesUnderTest [
	^ #('Mutalk-Model')
]

{ #category : #accessing }
MutationTestCaseResource >> error [
	3 zork
]

{ #category : #accessing }
MutationTestCaseResource >> fail [
	self assert: false.
]

{ #category : #accessing }
MutationTestCaseResource >> pass [
	self assert: true
]
