Class {
	#name : #ReplaceSelectWithRejectMutantOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : #'Mutalk-Model-Operators'
}

{ #category : #accessing }
ReplaceSelectWithRejectMutantOperator >> newSelector [
	^#reject:
]

{ #category : #accessing }
ReplaceSelectWithRejectMutantOperator >> oldSelector [
	^#select:
]
