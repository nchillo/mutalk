Class {
	#name : #MutationTestingAnalysisLoggerTest,
	#superclass : #TestCase,
	#category : #'Mutalk-Model-Tests'
}

{ #category : #testing }
MutationTestingAnalysisLoggerTest >> testExecutingSimpleMutation [

	| analysis logger operator configuration |

	logger := MockMutationTestingAnalysisLogger new.
	operator := ReplacePlusWithMinusMutantOperator new.

	configuration := MutationTestingConfiguration
		forAll: ( Array with: operator )
		with: AllMutationsGenerationStrategy new
		and: AllTestsMethodsRunningMutantEvaluationStrategy new
		using: logger.
	analysis := MutationTestingAnalysis
		testCasesFrom: ( Array with: AuxiliarClassForMutationTestingAnalysisTest )
		mutating: ( Array with: AuxiliarClassForMutationTestingAnalysis )
		using: configuration.
	analysis run.
	self assert: logger loggedStartAnalysis.
	self
		assert:
			( logger
				loggedStartBuildingMutationsFor: AuxiliarClassForMutationTestingAnalysis >> #methodWithOnePlusSender
				using: operator ).
	self
		assert:
			( logger
				loggedStartMutantEvaluationForMutationOf: AuxiliarClassForMutationTestingAnalysis >> #methodWithOnePlusSender )
]
