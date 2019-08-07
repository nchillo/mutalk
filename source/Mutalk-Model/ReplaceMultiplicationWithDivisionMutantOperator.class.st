Class {
	#name : #ReplaceMultiplicationWithDivisionMutantOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : #'Mutalk-Model-Operators'
}

{ #category : #accessing }
ReplaceMultiplicationWithDivisionMutantOperator >> newSelector [
	^#/
]

{ #category : #accessing }
ReplaceMultiplicationWithDivisionMutantOperator >> oldSelector [
	^#*
]
