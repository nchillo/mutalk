Class {
	#name : #SelectingFromCoverageMutantEvaluationStrategy,
	#superclass : #MutantEvaluationStrategy,
	#category : #'Mutalk-Model-Strategies'
}

{ #category : #Running }
SelectingFromCoverageMutantEvaluationStrategy >> buildSuiteFor: mutation using: coverageAnalysisResult [
	| suite |
	suite := TestSuite named: 'MutationEvaluation'.
	suite
		addTests:
			((coverageAnalysisResult testCasesThatCovers: mutation originalMethod)
				collect: [ :each | each testCase ]).
	^ suite
]

{ #category : #Running }
SelectingFromCoverageMutantEvaluationStrategy >> runSuite: suite [

	^suite runStoppingOnFirstFailOrError 
]
