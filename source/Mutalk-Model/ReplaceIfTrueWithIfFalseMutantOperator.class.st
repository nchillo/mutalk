Class {
	#name : #ReplaceIfTrueWithIfFalseMutantOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : #'Mutalk-Model-Operators'
}

{ #category : #accessing }
ReplaceIfTrueWithIfFalseMutantOperator >> newSelector [
	^#ifFalse:
]

{ #category : #accessing }
ReplaceIfTrueWithIfFalseMutantOperator >> oldSelector [
	^#ifTrue:
]
