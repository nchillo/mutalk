Class {
	#name : #ReplaceDivisionWithMultiplicationMutantOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : #'Mutalk-Model-Operators'
}

{ #category : #accessing }
ReplaceDivisionWithMultiplicationMutantOperator >> newSelector [
	^#*
]

{ #category : #accessing }
ReplaceDivisionWithMultiplicationMutantOperator >> oldSelector [
	^#/
]
