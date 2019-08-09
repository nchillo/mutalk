Class {
	#name : #ReplaceGreaterOrEqualWithEqualMutantOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : #'Mutalk-Model-Operators'
}

{ #category : #accessing }
ReplaceGreaterOrEqualWithEqualMutantOperator >> newSelector [
	^#=
]

{ #category : #accessing }
ReplaceGreaterOrEqualWithEqualMutantOperator >> oldSelector [
	^#>=
]

{ #category : #suggestions }
ReplaceGreaterOrEqualWithEqualMutantOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [

	^ aMutantKillingSuggestionGenerator
		suggestionForMutationProducedByAReplaceGreaterOrEqualWithEqualMutantOperator: aMutation
]
