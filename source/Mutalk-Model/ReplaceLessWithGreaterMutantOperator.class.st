Class {
	#name : #ReplaceLessWithGreaterMutantOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : #'Mutalk-Model-Operators'
}

{ #category : #accessing }
ReplaceLessWithGreaterMutantOperator >> newSelector [
	^#>
]

{ #category : #accessing }
ReplaceLessWithGreaterMutantOperator >> oldSelector [
	^#<
]
