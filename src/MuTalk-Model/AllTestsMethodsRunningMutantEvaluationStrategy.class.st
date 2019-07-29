Class {
	#name : #AllTestsMethodsRunningMutantEvaluationStrategy,
	#superclass : #MutantEvaluationStrategy,
	#category : #'MuTalk-Model-Strategies'
}

{ #category : #private }
AllTestsMethodsRunningMutantEvaluationStrategy >> testCasesToEvaluate: aMutation for: aCoverageResult [

	^ aCoverageResult testCases
]
