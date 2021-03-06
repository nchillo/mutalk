Class {
	#name : #ReplaceLessOrEqualWithTrueOperator,
	#superclass : #MutantOperator,
	#category : #'Mutalk-Model-Operators'
}

{ #category : #printing }
ReplaceLessOrEqualWithTrueOperator >> description [
	^'Replace #''<='' with true'
]

{ #category : #applying }
ReplaceLessOrEqualWithTrueOperator >> expressionToReplace [ 
	^'``@object <= ``@aBlock'
]

{ #category : #applying }
ReplaceLessOrEqualWithTrueOperator >> newExpression [ 
	^'true'
]

{ #category : #applying }
ReplaceLessOrEqualWithTrueOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceLessOrEqualWithTrueOperator: aMutation.
]
