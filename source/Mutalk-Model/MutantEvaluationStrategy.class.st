Class {
	#name : #MutantEvaluationStrategy,
	#superclass : #Object,
	#category : #'Mutalk-Model-Strategies'
}

{ #category : #comparing }
MutantEvaluationStrategy >> = anStrategy [

	^self class = anStrategy class
]

{ #category : #Running }
MutantEvaluationStrategy >> buildSuiteFor: mutation using: coverageAnalysisResult [
	self subclassResponsibility
]

{ #category : #comparing }
MutantEvaluationStrategy >> minimumTimeout [

	^1 seconds  
]

{ #category : #Running }
MutantEvaluationStrategy >> runSuite:  suite [

	self subclassResponsibility 
]

{ #category : #evaluating }
MutantEvaluationStrategy >> timeoutForTestsOf: aMutantEvaluation [

	^ ( aMutantEvaluation coverageAnalysisResult timeToRunTests * 5 ) milliSeconds
		max: self minimumTimeout
]
