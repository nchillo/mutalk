Class {
	#name : #AllTestsMethodsRunningMutantEvaluationStrategy,
	#superclass : #MutantEvaluationStrategy,
	#category : #'Mutalk-Model-Strategies'
}

{ #category : #Running }
AllTestsMethodsRunningMutantEvaluationStrategy >> buildSuiteFor: mutation using: coverageAnalysisResult [
	| suite |
	suite := TestSuite named: 'MutationEvaluation'.
	suite
		addTests: (coverageAnalysisResult testCases collect: [ :each | each testCase ]).
	^ suite
]

{ #category : #Running }
AllTestsMethodsRunningMutantEvaluationStrategy >> runSuite:  suite [

	^ suite runStoppingOnFirstFailOrError 
]
