Class {
	#name : #ReplaceMaxWithMinMutantOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : #'Mutalk-Model-Operators'
}

{ #category : #accessing }
ReplaceMaxWithMinMutantOperator >> newSelector [
	^#min:
]

{ #category : #accessing }
ReplaceMaxWithMinMutantOperator >> oldSelector [
	^#max:
]
