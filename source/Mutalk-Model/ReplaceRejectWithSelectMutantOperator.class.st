Class {
	#name : #ReplaceRejectWithSelectMutantOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : #'Mutalk-Model-Operators'
}

{ #category : #accessing }
ReplaceRejectWithSelectMutantOperator >> newSelector [
	^#select:
]

{ #category : #accessing }
ReplaceRejectWithSelectMutantOperator >> oldSelector [
	^#reject:
]
