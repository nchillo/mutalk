Class {
	#name : #ReplaceNotEqualWithEqualOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : #'Mutalk-Model-Operators'
}

{ #category : #accessing }
ReplaceNotEqualWithEqualOperator >> newSelector [
	^#=
]

{ #category : #accessing }
ReplaceNotEqualWithEqualOperator >> oldSelector [
	^#~=
]
