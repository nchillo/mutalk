Class {
	#name : #ReplaceMinWithMaxMutantOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : #'Mutalk-Model-Operators'
}

{ #category : #accessing }
ReplaceMinWithMaxMutantOperator >> newSelector [
	^#max:
]

{ #category : #accessing }
ReplaceMinWithMaxMutantOperator >> oldSelector [
	^#min:
]
