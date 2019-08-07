Class {
	#name : #MutantEvaluationStrategy,
	#superclass : #Object,
	#category : #'MuTalk-Model-Strategies'
}

{ #category : #comparing }
MutantEvaluationStrategy >> = anStrategy [

	^self class = anStrategy class
]

{ #category : #evaluating }
MutantEvaluationStrategy >> testCasesToEvaluate: aMutation for: aCoverageResult [

	self subclassResponsibility
]

{ #category : #evaluating }
MutantEvaluationStrategy >> timeoutForTestsOf: aMutantEvaluation [
	^aMutantEvaluation coverageAnalysisResult timeToRunTests * 3
]
