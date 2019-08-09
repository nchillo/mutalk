Class {
	#name : #ReplaceAndWithEqvMutantOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : #'Mutalk-Model-Operators'
}

{ #category : #accessing }
ReplaceAndWithEqvMutantOperator >> newSelector [
	^#bEqv:
]

{ #category : #accessing }
ReplaceAndWithEqvMutantOperator >> oldSelector [
	^#and:
]

{ #category : #suggestions }
ReplaceAndWithEqvMutantOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [

	^ aMutantKillingSuggestionGenerator
		suggestionForMutationProducedByAReplaceAndWithEqvMutantOperator: aMutation
]
