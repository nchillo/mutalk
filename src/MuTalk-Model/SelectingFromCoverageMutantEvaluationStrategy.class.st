Class {
	#name : #SelectingFromCoverageMutantEvaluationStrategy,
	#superclass : #MutantEvaluationStrategy,
	#category : #'MuTalk-Model-Strategies'
}

{ #category : #private }
SelectingFromCoverageMutantEvaluationStrategy >> testCasesToEvaluate: aMutation for: aCoverageResult [

	^ aCoverageResult testCasesThatCovers: aMutation originalMethod
]
