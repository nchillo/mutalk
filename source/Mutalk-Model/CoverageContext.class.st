Class {
	#name : #CoverageContext,
	#superclass : #Object,
	#instVars : [
		'currentTest'
	],
	#category : #'Mutalk-Model-Coverage'
}

{ #category : #accessing }
CoverageContext >> currentTest [

	^ currentTest
]

{ #category : #accessing }
CoverageContext >> currentTest: aTestCase [

	currentTest := aTestCase
]
