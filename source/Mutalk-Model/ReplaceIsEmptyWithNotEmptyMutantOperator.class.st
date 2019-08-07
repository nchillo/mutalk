Class {
	#name : #ReplaceIsEmptyWithNotEmptyMutantOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : #'Mutalk-Model-Operators'
}

{ #category : #accessing }
ReplaceIsEmptyWithNotEmptyMutantOperator >> newSelector [
	^#notEmpty
]

{ #category : #accessing }
ReplaceIsEmptyWithNotEmptyMutantOperator >> oldSelector [
	^#isEmpty
]
