Class {
	#name : #MutantEvaluationStrategy,
	#superclass : #Object,
	#category : #'Mutalk-Model-Strategies'
}

{ #category : #comparing }
MutantEvaluationStrategy >> = anStrategy [

	^self class = anStrategy class
]

{ #category : #comparing }
MutantEvaluationStrategy >> minimumTimeout [

	^1 seconds  
]

{ #category : #evaluating }
MutantEvaluationStrategy >> testCasesToEvaluate: aMutation for: aCoverageResult [

	self subclassResponsibility
]

{ #category : #evaluating }
MutantEvaluationStrategy >> timeoutForTestsOf: aMutantEvaluation [

	^ ( aMutantEvaluation coverageAnalysisResult timeToRunTests * 5 ) milliSeconds
		max: self minimumTimeout
]
