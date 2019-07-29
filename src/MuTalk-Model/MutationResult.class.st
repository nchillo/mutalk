Class {
	#name : #MutationResult,
	#superclass : #Object,
	#category : #'MuTalk-Model-Results'
}

{ #category : #accessing }
MutationResult >> aliveMutants [

	^self particularResults
		select: [ :evaluationResult | evaluationResult survived ]
]

{ #category : #accessing }
MutationResult >> elapsedTime [

	self subclassResponsibility
]

{ #category : #accessing }
MutationResult >> killedMutants [

	^ self particularResults
		select: [ :evaluationResult | evaluationResult killed ]
]

{ #category : #accessing }
MutationResult >> killedOrTerminatedMutants [

	^ self particularResults
		select:
			[ :evaluationResult | evaluationResult killed or: [ evaluationResult terminated ] ]
]

{ #category : #details }
MutationResult >> mutationScore [

	"Returns the mutation Score of this general result. A mutation score is the
	killedOrTerminatedMutants / numberOfEvaluatedMutants"

	self numberOfEvaluatedMutants = 0
		ifTrue: [ ^ 0 ].
	^ ( self numberOfKilledOrTerminatedMutants * 100
		/ self numberOfEvaluatedMutants ) asInteger
]

{ #category : #accessing }
MutationResult >> mutations [

	^ self particularResults
		collect: [ :mutantResult | mutantResult mutant ]
]

{ #category : #details }
MutationResult >> numberOfAliveMutants [

	"Returns the number of survived Mutants of this result"

	^ self aliveMutants size
]

{ #category : #details }
MutationResult >> numberOfEvaluatedMutants [

	"Returns the number of Mutants Evaluated"

	^self particularResults size
]

{ #category : #details }
MutationResult >> numberOfKilledMutants [

	"Returns the number of killed Mutants of this result"

	^ self killedMutants size
]

{ #category : #details }
MutationResult >> numberOfKilledOrTerminatedMutants [

	"Returns the number of killed or terminated Mutants of this result"

	^ self killedOrTerminatedMutants size
]

{ #category : #details }
MutationResult >> numberOfTerminatedMutants [

	"Returns the number of Mutants terminated"

	^ self terminatedMutants size
]

{ #category : #accessing }
MutationResult >> particularResults [

	self subclassResponsibility
]

{ #category : #printing }
MutationResult >> printOn: aStream [

	self subclassResponsibility
]

{ #category : #accessing }
MutationResult >> terminatedMutants [

	^self particularResults
		select: [ :evaluationResult | evaluationResult terminated ]
]
