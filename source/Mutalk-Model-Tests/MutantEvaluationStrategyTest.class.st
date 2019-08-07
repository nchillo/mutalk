Class {
	#name : #MutantEvaluationStrategyTest,
	#superclass : #TestCase,
	#instVars : [
		'resource'
	],
	#category : #'Mutalk-Model-Tests'
}

{ #category : #accessing }
MutantEvaluationStrategyTest class >> packageNamesUnderTest [
	^ #('MuTalk-Model')
]

{ #category : #accessing }
MutantEvaluationStrategyTest class >> resources [
	^ {MutationTestingResource}
]

{ #category : #building }
MutantEvaluationStrategyTest >> setUp [
	resource := MutationTestingResource current
]

{ #category : #tests }
MutantEvaluationStrategyTest >> testComparingEvaluationStrategies [

	self
		assert: SelectingFromCoverageMutantEvaluationStrategy new
		equals: SelectingFromCoverageMutantEvaluationStrategy new.
	self
		assert: AllTestsMethodsRunningMutantEvaluationStrategy new
		equals: AllTestsMethodsRunningMutantEvaluationStrategy new.
	self
		deny: AllTestsMethodsRunningMutantEvaluationStrategy new
		equals: SelectingFromCoverageMutantEvaluationStrategy new
]

{ #category : #testing }
MutantEvaluationStrategyTest >> testSelectingFromCoverageEvaluationStrategyShouldOnlyEvaluateSpecificTestCases [

	"tests that the message #testCasesToEvaluateFrom: returns only the test cases that cover the mutated code"

	| classes mutationTestingAnalysis testCases mutation operator evaluationStrategy configuration  coverage|

	classes := OrderedCollection with: AuxiliarClassForTestingStrategies.
	operator := ReplaceIfTrueWithIfFalseMutantOperator new.
	evaluationStrategy := SelectingFromCoverageMutantEvaluationStrategy new.
	configuration := MutationTestingConfiguration
		forAll: ( Array with: operator )
		with: AllMutationsGenerationStrategy new
		and: evaluationStrategy
		using: NullMutationTestingAnalysisLogger new.
	mutationTestingAnalysis := MutationTestingAnalysis
		for: AuxiliarTestClassForTestingStrategies suite tests
		mutating: classes
		using: configuration.
	coverage := mutationTestingAnalysis generateCoverageAnalysis.
	mutation := ( operator mutationsFor: AuxiliarClassForTestingStrategies >> #method1 )
		asOrderedCollection first.
	testCases := evaluationStrategy testCasesToEvaluate: mutation for: coverage.
	self
		assert: ( ( testCases collect: [ :each | each selector ] ) includes: #testMethodThatCoverMethod1 ).
	self
		deny: ( ( testCases collect: [ :each | each selector ] ) includes: #testMethodThatCoverMethod2 )
]
