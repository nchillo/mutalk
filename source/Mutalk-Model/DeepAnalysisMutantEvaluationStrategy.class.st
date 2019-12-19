Class {
	#name : #DeepAnalysisMutantEvaluationStrategy,
	#superclass : #MutantEvaluationStrategy,
	#category : #'Mutalk-Model-Strategies'
}

{ #category : #Running }
DeepAnalysisMutantEvaluationStrategy >> buildSuiteFor: mutation using: coverageAnalysisResult [
	| suite |
	suite := TestSuite named: 'MutationEvaluation'.
	suite
		addTests: (coverageAnalysisResult testCases collect: [ :each | each testCase ]).
	^ suite
]

{ #category : #Running }
DeepAnalysisMutantEvaluationStrategy >> runSuite:  suite [
	"Run all the tests for every mutant"
	^suite run
]
