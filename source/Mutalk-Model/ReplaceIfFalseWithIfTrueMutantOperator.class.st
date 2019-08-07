Class {
	#name : #ReplaceIfFalseWithIfTrueMutantOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : #'Mutalk-Model-Operators'
}

{ #category : #accessing }
ReplaceIfFalseWithIfTrueMutantOperator >> newSelector [
	^#ifTrue:
]

{ #category : #accessing }
ReplaceIfFalseWithIfTrueMutantOperator >> oldSelector [
	^#ifFalse:
]
