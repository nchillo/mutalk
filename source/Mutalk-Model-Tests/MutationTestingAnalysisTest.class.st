Class {
	#name : #MutationTestingAnalysisTest,
	#superclass : #TestCase,
	#category : #'Mutalk-Model-Tests'
}

{ #category : #accessing }
MutationTestingAnalysisTest class >> classNamesNotUnderTest [
	^ #('MutationBrowser' 'MutationTestRunner' )
]

{ #category : #accessing }
MutationTestingAnalysisTest class >> packageNamesUnderTest [
	^ #('Mutalk-Model')
]

{ #category : #testing }
MutationTestingAnalysisTest >> defaultConfigurationWith: anOperatorCollection [

	^ MutationTestingConfiguration
		forAll: anOperatorCollection
		with: AllMutationsGenerationStrategy new
		and: AllTestsMethodsRunningMutantEvaluationStrategy new
		using: NullMutationTestingAnalysisLogger new
]

{ #category : #accessing }
MutationTestingAnalysisTest >> ifFalseForIfTrueReplacementMutation [

	"Return a Collection with a Mutation Operation to be applied to the AuxiliarClass. 
	In this case, the operation will be a boolean Replacement (ifFalse for ifTrue)."

	| operator |

	operator := ReplaceIfFalseWithIfTrueMutantOperator new.
	^ OrderedCollection with: operator
]

{ #category : #accessing }
MutationTestingAnalysisTest >> ifTrueForIfFalseReplacementMutation [

	"Return a Collection with a Mutation Operation to be applied to the
	DummyClass. In this case, the operation will be a boolean Replacement (ifTrue for ifFalse)."

	| operator |

	operator := ReplaceIfTrueWithIfFalseMutantOperator new.
	^ OrderedCollection with: operator
]

{ #category : #accessing }
MutationTestingAnalysisTest >> minusForPlusReplacementMutation [

	"Return a Collection with a Mutation Operation to be applied to the method in MutationTestingAuxiliarClass. 
	In this case, the operation will be an Arithmetic Replacement (Minus for Plus)."

	| operator |

	operator := ReplaceMinusWithPlusMutantOperator new.
	^ OrderedCollection with: operator
]

{ #category : #accessing }
MutationTestingAnalysisTest >> plusForMinusReplacementMutation [

	"Return a Collection with a Mutation Operation to be applied to the
	DummyClass. In this case, the operation will be an Arithmetic
	Replacement (Plus for Minus)."

	| operator |

	operator := ReplacePlusWithMinusMutantOperator new.
	^ OrderedCollection with: operator
]

{ #category : #accessing }
MutationTestingAnalysisTest >> selectForRejectReplacementMutation [

	| operator |

	operator := ReplaceSelectWithRejectMutantOperator new.
	^ OrderedCollection with: operator
]

{ #category : #testing }
MutationTestingAnalysisTest >> testExecutingSimpleMutation [

	| analysis results generalResult mutationResult |

	analysis := MutationTestingAnalysis
		testCasesFrom: {AuxiliarClassForMutationTestingAnalysisTest}
		mutatingClasses: {AuxiliarClassForMutationTestingAnalysis}
		using: ( self defaultConfigurationWith: self plusForMinusReplacementMutation ).

	generalResult := analysis run.
	results := generalResult particularResults.
	self assert: results size equals: 1.
	mutationResult := results first.
	self deny: mutationResult survived.
	self deny: mutationResult terminated.
	self assert: mutationResult killed.
	self assert: generalResult numberOfKilledMutants equals: 1
]

{ #category : #testing }
MutationTestingAnalysisTest >> testExecutingSimpleMutationForClassMethods [

	| analysis results generalResult mutationResult |

	analysis := MutationTestingAnalysis
		testCasesFrom: {AuxiliarClassForMutationTestingAnalysisTest}
		mutatingClasses: {AuxiliarClassForMutationTestingAnalysis}
		using: ( self defaultConfigurationWith: self selectForRejectReplacementMutation ).
	generalResult := analysis run.
	results := generalResult particularResults.
	self assert: results size equals: 1.
	mutationResult := results first.
	self deny: mutationResult survived.
	self deny: mutationResult terminated.
	self assert: mutationResult killed.
	self assert: generalResult numberOfKilledMutants equals: 1
]

{ #category : #testing }
MutationTestingAnalysisTest >> testExecutingTwoMutantsFromDiferentMethods [

	"Obtain 2 mutants using ifFalse-->ifTrue replacement in two diferent methods."

	| analysis results operatorSelection |

	operatorSelection := OrderedCollection new.
	operatorSelection addAll: self ifFalseForIfTrueReplacementMutation.
	analysis := MutationTestingAnalysis
		testCasesFrom: {}
		mutatingClasses: {AuxiliarClassForMutationTestingAnalysis} 
		using: ( self defaultConfigurationWith: operatorSelection ).
	results := analysis run particularResults.
	self assert: results size equals: 2.
	results do: [ :mutationResult | self deny: mutationResult killed ]
]

{ #category : #testing }
MutationTestingAnalysisTest >> testExecutingTwoMutantsFromSameMethod [

	"Obtain 2 mutants using --->+ replacement in only one method."

	| analysis results operatorSelection |

	operatorSelection := OrderedCollection new.
	operatorSelection addAll: self minusForPlusReplacementMutation.
	analysis := MutationTestingAnalysis
		testCasesFrom: {}
		mutatingClasses: {AuxiliarClassForMutationTestingAnalysis} 
		using: ( self defaultConfigurationWith: operatorSelection ).
	results := analysis run particularResults.
	self assert: results size equals: 2.
	results do: [ :mutationResult | self deny: mutationResult killed ]
]

{ #category : #testing }
MutationTestingAnalysisTest >> testExecutingTwoMutations [

	"Execute 2 diferent mutations #ifTrue-->#ifFalse: and
	#+-->#-"

	| analysis results generalResult operatorSelection |

	operatorSelection := OrderedCollection new.
	operatorSelection addAll: self plusForMinusReplacementMutation.
	operatorSelection addAll: self ifTrueForIfFalseReplacementMutation.
	analysis := MutationTestingAnalysis
		testCasesFrom: {AuxiliarClassForMutationTestingAnalysisTest}
		mutatingClasses: {AuxiliarClassForMutationTestingAnalysis}
		using: ( self defaultConfigurationWith: operatorSelection ).
	generalResult := analysis run.
	results := generalResult particularResults.
	self assert: results size equals: 2.
	results
		do: [ :mutationResult | 
			self deny: mutationResult survived.
			self deny: mutationResult terminated.
			self assert: mutationResult killed
			].
	self assert: generalResult numberOfKilledMutants equals: 2
]
