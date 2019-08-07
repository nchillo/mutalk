Class {
	#name : #ReplaceEqualWithNotEqualOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : #'Mutalk-Model-Operators'
}

{ #category : #accessing }
ReplaceEqualWithNotEqualOperator >> newSelector [
	^#~=
]

{ #category : #accessing }
ReplaceEqualWithNotEqualOperator >> oldSelector [
	^#=
]
