Class {
	#name : #MutantGenerationStrategyTest,
	#superclass : #TestCase,
	#instVars : [
		'resource'
	],
	#category : #'Mutalk-Model-Tests'
}

{ #category : #testing }
MutantGenerationStrategyTest >> testSelectingFromCoverageMutationsGenerationShouldOnlyMutateCoveredMethods [

	| classes mutationTestingAnalysis operator configuration result |

	classes := {AuxiliarClassForTestingStrategies}.
	operator := ReplaceIfTrueWithIfFalseMutantOperator new.
	configuration := MutationTestingConfiguration
		forAll: {operator}
		with: SelectingFromCoverageMutationsGenerationStrategy new
		and: AllTestsMethodsRunningMutantEvaluationStrategy new
		using: NullMutationTestingAnalysisLogger new.
	mutationTestingAnalysis := MutationTestingAnalysis
		testCasesFrom: {AuxiliarTestClassForTestingStrategies}
		mutatingClasses: classes
		using: configuration.
	result := mutationTestingAnalysis run.
	self
		assert: ( ( result mutations collect: [ :each | each originalMethod selector ] ) includes: #method1 ).
	self
		deny:
			( ( result mutations collect: [ :each | each originalMethod selector ] )
				includes: #aNotCoveredMethod )
]
