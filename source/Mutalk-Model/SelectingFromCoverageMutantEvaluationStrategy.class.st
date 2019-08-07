Class {
	#name : #SelectingFromCoverageMutantEvaluationStrategy,
	#superclass : #MutantEvaluationStrategy,
	#category : #'Mutalk-Model-Strategies'
}

{ #category : #private }
SelectingFromCoverageMutantEvaluationStrategy >> testCasesToEvaluate: aMutation for: aCoverageResult [

	^ aCoverageResult testCasesThatCovers: aMutation originalMethod
]
