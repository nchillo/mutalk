Class {
	#name : #MutationTestingAnalysis,
	#superclass : #Object,
	#instVars : [
		'testCases',
		'coverageAnalysisResult',
		'configuration',
		'modelMethods'
	],
	#category : #'Mutalk-Model'
}

{ #category : #'instance creation' }
MutationTestingAnalysis class >> for: testCases mutating: methods using: aMutationTestingConfiguration [

	^ self new
		initializeFor: testCases mutating: methods using: aMutationTestingConfiguration;
		yourself
]

{ #category : #'instance creation' }
MutationTestingAnalysis class >> methodsFrom: classes [

	^ classes
		inject: OrderedCollection new
		into: [ :collection :class | 
			collection addAll: class localMethods.
			collection addAll: class class localMethods.
			collection
			]
]

{ #category : #'instance creation' }
MutationTestingAnalysis class >> testCasesFrom: testClasses [

	^ testClasses
		inject: OrderedCollection new
		into: [ :testCases :testClass | 
			( ( testClass isKindOf: TestCase class ) and: [ testClass isAbstract not ] )
				ifTrue: [ testCases addAll: ( self testCasesReferencesFrom: testClass ) ].
			testCases
			]
]

{ #category : #'instance creation' }
MutationTestingAnalysis class >> testCasesFrom: testClasses mutating: methods using: aMutationTestingConfiguration [

	^ self
		for: ( self testCasesFrom: testClasses )
		mutating: methods
		using: aMutationTestingConfiguration
]

{ #category : #'instance creation' }
MutationTestingAnalysis class >> testCasesFrom: testClasses mutatingClasses: classes using: aMutationTestingConfiguration [

	^ self
		for: ( self testCasesFrom: testClasses )
		mutating: ( self methodsFrom: classes )
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

	^ ( CoverageAnalysis for: modelMethods running: testCases ) run
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

	| results |

	results := OrderedCollection new.
	someMutations
		do: [ :aMutation | 
			configuration logger logStartEvaluating: aMutation.
			results
				add:
					( MutantEvaluation
						for: aMutation
						using: testCases
						following: configuration evaluationStrategy
						andConsidering: self coverageAnalysisResult ) value
			]
		displayingProgress: 'Running mutants'.
	^ results
]

{ #category : #'initialize-release' }
MutationTestingAnalysis >> initializeFor: someTestCasesReferences mutating: collectionOfModelMethods using: aConfiguration [

	modelMethods := collectionOfModelMethods.
	testCases := someTestCasesReferences.
	configuration := aConfiguration.
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
		millisecondsToRun: [ coverageAnalysisResult := self generateCoverageAnalysis.
			mutantsResults := self
				generateResultsForAll: ( self generateMutationsUsing: coverageAnalysisResult )
			].
	MutationTestingGeneralResult for: mutantsResults timed: ( Duration milliSeconds: time )
	]
		on: TestsWithErrorsException
		do: [ :ex | MutationTestingErrorResult describedAs: 'Tests con errores' ]
]
