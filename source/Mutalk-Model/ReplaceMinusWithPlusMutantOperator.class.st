Class {
	#name : #ReplaceMinusWithPlusMutantOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : #'Mutalk-Model-Operators'
}

{ #category : #accessing }
ReplaceMinusWithPlusMutantOperator >> newSelector [
	^#+
]

{ #category : #accessing }
ReplaceMinusWithPlusMutantOperator >> oldSelector [
	^#-
]
