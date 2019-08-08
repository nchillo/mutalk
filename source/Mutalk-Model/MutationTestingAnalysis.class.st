Class {
	#name : #MutationTestingAnalysis,
	#superclass : #Object,
	#instVars : [
		'modelClasses',
		'testCases',
		'coverageAnalysisResult',
		'configuration'
	],
	#category : #'Mutalk-Model'
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

{ #category : #running }
MutationTestingAnalysis >> generateCoverageAnalysis [

	^ ( CoverageAnalysis for: self modelClasses running: testCases ) run
]

{ #category : #running }
MutationTestingAnalysis >> generateMutationsUsing: aCoverageAnalysis [

	^ configuration generationStrategy
		mutationsFor: aCoverageAnalysis
		usingAll: configuration operators
		loggingIn: configuration logger
]

{ #category : #running }
MutationTestingAnalysis >> generateResultsForAll: someMutations [

	^ someMutations
		inject: OrderedCollection new
		into: [ :results :aMutation | 
			configuration logger logStartEvaluating: aMutation.
			results
				add:
					( MutantEvaluation
						for: aMutation
						using: testCases
						following: configuration evaluationStrategy
						andConsidering: self coverageAnalysisResult ) value.
			results
			]
]

{ #category : #'initialize-release' }
MutationTestingAnalysis >> initializeFor: someTestCasesReferences mutating: someModelClasses using: aConfiguration [

	modelClasses := someModelClasses.
	testCases := someTestCasesReferences.
	configuration := aConfiguration.
]

{ #category : #accesing }
MutationTestingAnalysis >> modelClasses [
	"Filter tests and testsResources"
	^ modelClasses
		reject: [:class | self testBaseClasses
				anySatisfy: [:classToFilter | class includesBehavior: classToFilter]]
]

{ #category : #running }
MutationTestingAnalysis >> run [

	"Obtain mutants applying the operators in the classes (or
	methods of
	those classes) and execute all mutants in the set of testClases.
	We obtain a result for each mutant generated"

	^ [ | mutantsResults time |

	testCases do: [ :aTestCase | aTestCase run ].
	configuration logger logAnalysisStartFor: self.
	time := Time
		millisecondsToRun: [ | coverageAnalysis |

			coverageAnalysis := self generateCoverageAnalysis.
			mutantsResults := self generateResultsForAll: ( self generateMutationsUsing: coverageAnalysis )
			].
	MutationTestingGeneralResult for: mutantsResults timed: ( Duration milliSeconds: time )
	]
		on: TestsWithErrorsException
		do: [ :ex | MutationTestingErrorResult describedAs: 'Tests con errores' ]
]

{ #category : #accesing }
MutationTestingAnalysis >> testBaseClasses [

	^OrderedCollection with: TestCase with: TestResource
]
