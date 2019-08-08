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

	| estimatedTimeout |

	estimatedTimeout := ( aMutantEvaluation coverageAnalysisResult timeToRunTests * 5 ) milliSeconds.
	^ estimatedTimeout < self minimumTimeout
		ifTrue: [ self minimumTimeout ]
		ifFalse: [ estimatedTimeout ]
]
