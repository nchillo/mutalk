Class {
	#name : #MutantGenerationStrategyTest,
	#superclass : #TestCase,
	#instVars : [
		'resource'
	],
	#category : 'MuTalk-Tests'
}

{ #category : #testing }
MutantGenerationStrategyTest >> testSelectingFromCoverageMutationsGenerationShouldOnlyMutateCoveredMethods [

	| classes mutationTestingAnalysis operator configuration |

	classes := OrderedCollection with: AuxiliarClassForTestingStrategies.
	operator := ReplaceIfTrueWithIfFalseMutantOperator new.
	configuration := MutationTestingConfiguration
		forAll: ( Array with: operator )
		with: SelectingFromCoverageMutationsGenerationStrategy new
		and: AllTestsMethodsRunningMutantEvaluationStrategy new
		using: NullMutationTestingAnalysisLogger new.
	mutationTestingAnalysis := MutationTestingAnalysis
		for: ( MutationTestingAnalysis testCasesReferencesFrom: AuxiliarTestClassForTestingStrategies )
		mutating: classes
		using: configuration.
	mutationTestingAnalysis run.
	self
		assert:
			( ( mutationTestingAnalysis mutations collect: [ :each | each originalMethod selector ] )
				includes: #method1 ).
	self
		deny:
			( ( mutationTestingAnalysis mutations collect: [ :each | each originalMethod selector ] )
				includes: #aNotCoveredMethod )
]
