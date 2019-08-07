Class {
	#name : #ReplaceLessOrEqualWithGreaterMutantOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : #'Mutalk-Model-Operators'
}

{ #category : #accessing }
ReplaceLessOrEqualWithGreaterMutantOperator >> newSelector [
	^#>
]

{ #category : #accessing }
ReplaceLessOrEqualWithGreaterMutantOperator >> oldSelector [
	^#<=
]
