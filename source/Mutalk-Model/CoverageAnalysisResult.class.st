Class {
	#name : #CoverageAnalysisResult,
	#superclass : #Object,
	#instVars : [
		'methodToTestDictionary',
		'timeToRunTests',
		'coverageAnalysis'
	],
	#category : #'Mutalk-Model-Coverage'
}

{ #category : #'instance creation' }
CoverageAnalysisResult class >> for: aCoverageAnalysis from: aDictionaryOfMethodToTestCasesRelations elapsedTime: aTimeToRunTests [

	^ self new
		initializeFor: aCoverageAnalysis
		from: aDictionaryOfMethodToTestCasesRelations
		elapsedTime: aTimeToRunTests
]

{ #category : #accessing }
CoverageAnalysisResult >> coveredMethods [

	^ methodToTestDictionary keys asIdentitySet
]

{ #category : #'initialize-release' }
CoverageAnalysisResult >> initializeFor: aCoverageAnalysis from: aDictionaryOfMethodToTestCasesRelations elapsedTime: aTimeToRunTests [

	coverageAnalysis := aCoverageAnalysis.
	methodToTestDictionary := aDictionaryOfMethodToTestCasesRelations.
	timeToRunTests := aTimeToRunTests
]

{ #category : #accessing }
CoverageAnalysisResult >> modelClasses [

	^ coverageAnalysis classes
]

{ #category : #accessing }
CoverageAnalysisResult >> testCases [

	^ coverageAnalysis testCases
]

{ #category : #accessing }
CoverageAnalysisResult >> testCasesThatCovers: aCompiledMethod [

	^ methodToTestDictionary
		at: aCompiledMethod
		ifAbsent: [ OrderedCollection new ]
]

{ #category : #accessing }
CoverageAnalysisResult >> timeToRunTests [

	^ timeToRunTests
]
