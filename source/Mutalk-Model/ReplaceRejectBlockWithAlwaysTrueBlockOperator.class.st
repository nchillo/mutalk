Class {
	#name : #ReplaceRejectBlockWithAlwaysTrueBlockOperator,
	#superclass : #MutantOperator,
	#category : #'Mutalk-Model-Operators'
}

{ #category : #printing }
ReplaceRejectBlockWithAlwaysTrueBlockOperator >> description [
	^'Replace Reject block with [:each | true]'.
]

{ #category : #applying }
ReplaceRejectBlockWithAlwaysTrueBlockOperator >> expressionToReplace [ 
	^'``@collection reject: ``@aBlock'
]

{ #category : #applying }
ReplaceRejectBlockWithAlwaysTrueBlockOperator >> newExpression [
	^'``@collection reject: [:each | true]'
]
