Class {
	#name : #ReplaceLessOrEqualWithEqualMutantOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : #'Mutalk-Model-Operators'
}

{ #category : #accessing }
ReplaceLessOrEqualWithEqualMutantOperator >> newSelector [ 
	^#=
]

{ #category : #accessing }
ReplaceLessOrEqualWithEqualMutantOperator >> oldSelector [
	^#<=
]

{ #category : #suggestions }
ReplaceLessOrEqualWithEqualMutantOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [ 
	^ aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceLessOrEqualWithEqualMutantOperator: aMutation
]
