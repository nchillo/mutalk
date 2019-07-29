Class {
	#name : #CoverageContext,
	#superclass : #Object,
	#instVars : [
		'currentTest'
	],
	#category : #'MuTalk-Model-Coverage'
}

{ #category : #accessing }
CoverageContext >> currentTest [

	^ currentTest
]

{ #category : #accessing }
CoverageContext >> currentTest: aTestCase [

	currentTest := aTestCase
]
