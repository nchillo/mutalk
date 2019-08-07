Class {
	#name : #MutationsGenerationStrategy,
	#superclass : #Object,
	#category : #'MuTalk-Model-Strategies'
}

{ #category : #comparing }
MutationsGenerationStrategy >> = anStrategy [

	^self class = anStrategy class
]

{ #category : #generating }
MutationsGenerationStrategy >> methodsToMutateFrom: aCoverageResult [

	self subclassResponsibility
]

{ #category : #generating }
MutationsGenerationStrategy >> mutationsFor: aMethod usingAll: aCollectionOfMutantOperators logginIn: aLogger [ 
	| parseTree |
	parseTree := aMethod parseTree.
	^ aCollectionOfMutantOperators
		inject: OrderedCollection new
		into: [:mutations :anOperator | 
			aLogger logStartBuildingMutantionsFor: aMethod using: anOperator.
			(aMethod ignoredMutationOperators includes: anOperator class) 
				ifFalse: [ mutations addAll: (anOperator mutationsFor: aMethod with: parseTree) ].
			mutations ]
]

{ #category : #generating }
MutationsGenerationStrategy >> mutationsFor: aCoverageResult usingAll: operators loggingIn: aLogger [

	| mutations |

	mutations := OrderedCollection new.
	( self methodsToMutateFrom: aCoverageResult )
		do: [ :aMethod | 
			mutations
				addAll:
					( self mutationsFor: aMethod usingAll: operators logginIn: aLogger )
			]
		displayingProgress: 'Building Mutants'.
	^ mutations
]

{ #category : #logging }
MutationsGenerationStrategy >> nullLogger [

	^ NullMutationTestingAnalysisLogger new.
]
