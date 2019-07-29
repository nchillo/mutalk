Class {
	#name : #TestSuiteWrappedForCoverage,
	#superclass : #TestSuite,
	#instVars : [
		'coverageContext'
	],
	#category : #'MuTalk-Model-Generation'
}

{ #category : #'instance creation' }
TestSuiteWrappedForCoverage class >> for: aCoverageContext named: aString [

	^ self new initializeFor: aCoverageContext named: aString
]

{ #category : #initialization }
TestSuiteWrappedForCoverage >> initializeFor: aCoverageContext named: aString [

	self name: aString.
	coverageContext := aCoverageContext
]

{ #category : #running }
TestSuiteWrappedForCoverage >> run: aResult [

	self tests
		do: [ :each | 
			coverageContext currentTest: each.
			self changed: each.
			each run: aResult.
			coverageContext currentTest: nil
			]
		displayingProgress: 'Analysing Coverage'
]
