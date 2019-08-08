Class {
	#name : #MutantEvaluation,
	#superclass : #Object,
	#instVars : [
		'mutation',
		'strategy',
		'testCases',
		'coverageAnalysisResult'
	],
	#category : #'Mutalk-Model-Generation'
}

{ #category : #'instance creation' }
MutantEvaluation class >> for: aMutation using: aCollectionOftestCases following: aMutantEvaluationStrategy andConsidering: aCoverageAnalysisResult [

	^ self new
		initializeFor: aMutation
		using: aCollectionOftestCases
		following: aMutantEvaluationStrategy
		andConsidering: aCoverageAnalysisResult
]

{ #category : #accessing }
MutantEvaluation >> coverageAnalysisResult [

	^coverageAnalysisResult 
]

{ #category : #'initialize-release' }
MutantEvaluation >> initializeCoverageResultIfNil [

	coverageAnalysisResult
		ifNil: [ | coverageAnalysis |

			coverageAnalysis := CoverageAnalysis
				for: ( OrderedCollection with: mutation originalClass )
				running: testCases.
			coverageAnalysisResult := coverageAnalysis run
			]
]

{ #category : #'initialize-release' }
MutantEvaluation >> initializeFor: aMutation using: aCollectionOftestCases following: aMutantEvaluationStrategy andConsidering: aCoverageAnalysisResult [

	mutation := aMutation.
	testCases := aCollectionOftestCases.
	strategy := aMutantEvaluationStrategy.
	coverageAnalysisResult := aCoverageAnalysisResult
]

{ #category : #private }
MutantEvaluation >> runTests [

	"Collect all suite test and execute them."

	| suite |

	suite := TestSuite named: 'MutationEvaluation'.
	suite
		addTests:
			( ( strategy testCasesToEvaluate: mutation for: coverageAnalysisResult )
				collect: [ :each | each testCase ] ).
	^ [ suite runStoppingOnFirstFailOrError ]
		on: Error
		do: [ :ex | nil ]
]

{ #category : #private }
MutantEvaluation >> testResults [

	^ [ self runTests ] valueWithin: ( strategy timeoutForTestsOf: self ) onTimeout: [ nil ]
]

{ #category : #evaluation }
MutantEvaluation >> value [

	| testResults |

	self initializeCoverageResultIfNil.
	testResults := [ mutation install.
	self testResults
	]
		ensure: [ mutation uninstall ].
	^ MutantEvaluationResult
		for: mutation
		results: testResults
		producedBy: self
]
