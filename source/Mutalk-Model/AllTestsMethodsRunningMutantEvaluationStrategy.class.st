Class {
	#name : #AllTestsMethodsRunningMutantEvaluationStrategy,
	#superclass : #MutantEvaluationStrategy,
	#category : #'Mutalk-Model-Strategies'
}

{ #category : #private }
AllTestsMethodsRunningMutantEvaluationStrategy >> testCasesToEvaluate: aMutation for: aCoverageResult [

	^ aCoverageResult testCases
]
