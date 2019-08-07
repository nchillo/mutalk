Class {
	#name : #ReplaceGreaterOrEqualWithGreaterMutantOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : #'Mutalk-Model-Operators'
}

{ #category : #accessing }
ReplaceGreaterOrEqualWithGreaterMutantOperator >> newSelector [
	^#>
]

{ #category : #accessing }
ReplaceGreaterOrEqualWithGreaterMutantOperator >> oldSelector [
	^#>=
]

{ #category : #suggestions }
ReplaceGreaterOrEqualWithGreaterMutantOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [ 
	^ aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceGreaterOrEqualWithGreaterMutantOperator: aMutation
]
