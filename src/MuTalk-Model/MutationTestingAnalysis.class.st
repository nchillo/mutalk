Class {
	#name : #MutationTestingAnalysis,
	#superclass : #Object,
	#instVars : [
		'modelClasses',
		'particularResults',
		'elapsedTime',
		'mutations',
		'testCases',
		'coverageAnalysisResult',
		'configuration'
	],
	#category : #'MuTalk-Model'
}

{ #category : #'instance creation' }
MutationTestingAnalysis class >> for: testCases mutating: classes using: aMutationTestingConfiguration [

	^ self new
		initializeFor: testCases mutating: classes using: aMutationTestingConfiguration;
		yourself
]

{ #category : #'instance creation' }
MutationTestingAnalysis class >> testCasesFrom: testClasses [ 
	^ testClasses
		inject: OrderedCollection new
		into: [:testCases :testClass | 
			((testClass isKindOf: TestCase class)
					and: [testClass isAbstract not])
				ifTrue: [testCases
						addAll: (self testCasesReferencesFrom: testClass)].
			testCases]
]

{ #category : #'instance creation' }
MutationTestingAnalysis class >> testCasesFrom: testClasses mutating: classes using: aMutationTestingConfiguration [

	^ self
		for: ( self testCasesFrom: testClasses )
		mutating: classes
		using: aMutationTestingConfiguration
]

{ #category : #'instance creation' }
MutationTestingAnalysis class >> testCasesReferencesFrom: testClass [ 
	^ testClass allTestSelectors collect: 
		[ :each | 
		TestCaseReference 
			for: each
			in: testClass ]
]

{ #category : #accesing }
MutationTestingAnalysis >> coverageAnalysisResult [
	
	^coverageAnalysisResult
]

{ #category : #results }
MutationTestingAnalysis >> generalResult [
	^ MutationTestingGeneralResult
		for: particularResults
		timed: (Duration nanoSeconds: (Duration milliSeconds: elapsedTime) nanoSeconds)
]

{ #category : #running }
MutationTestingAnalysis >> generateCoverageAnalysis [
	coverageAnalysisResult := (CoverageAnalysis for: self modelClasses running: testCases) run; result
]

{ #category : #running }
MutationTestingAnalysis >> generateMutations [
	mutations := configuration generationStrategy 
		mutationsFor: self
		loggingIn: configuration logger
]

{ #category : #running }
MutationTestingAnalysis >> generateResults [
	particularResults := OrderedCollection new.
	mutations
		do: [:aMutation | configuration logger logStartEvaluating: aMutation. 
			particularResults add: (MutantEvaluation
					for: aMutation
					using: testCases
					following: configuration evaluationStrategy
					andConsidering: self coverageAnalysisResult) value]
		displayingProgress: 'Evaluating mutants'.
	^ particularResults
]

{ #category : #'initialize-release' }
MutationTestingAnalysis >> initializeFor: someTestCasesReferences mutating: someModelClasses using: aConfiguration [

	modelClasses := someModelClasses.
	testCases := someTestCasesReferences.
	particularResults := OrderedCollection new.
	elapsedTime := 0.
	configuration := aConfiguration.
]

{ #category : #accesing }
MutationTestingAnalysis >> modelClasses [
	"Filter tests and testsResources"
	^ modelClasses
		reject: [:class | self testBaseClasses
				anySatisfy: [:classToFilter | class includesBehavior: classToFilter]]
]

{ #category : #accesing }
MutationTestingAnalysis >> mutations [
	^mutations
]

{ #category : #accesing }
MutationTestingAnalysis >> operators [
	^configuration operators 
]

{ #category : #results }
MutationTestingAnalysis >> particularResults [
	^ particularResults
]

{ #category : #running }
MutationTestingAnalysis >> run [
	"Obtain mutants applying the operators in the classes (or
	methods of
	those classes) and execute all mutants in the set of testClases.
	We obtain a result for each mutant generated"
	^[testCases do: [ :aTestCase | aTestCase run ].
	configuration logger logAnalysisStartFor:self.
	elapsedTime := Time millisecondsToRun: [
					self generateCoverageAnalysis.
					self generateMutations.
					self generateResults.].
					true]
						on: TestsWithErrorsException
						do: [:ex | 
							self inform: 'Your tests have Errors or Failures. Please correct them.'.
							ex return: false]
]

{ #category : #accesing }
MutationTestingAnalysis >> testBaseClasses [

	^OrderedCollection with: TestCase with: TestResource
]

{ #category : #accesing }
MutationTestingAnalysis >> testCases [
	^testCases

]
