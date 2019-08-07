Extension { #name : #Boolean }

{ #category : #'*Mutalk-Model' }
Boolean >> bEqv: aBlock [

	^self eqv: aBlock value
]

{ #category : #'*Mutalk-Model' }
Boolean >> bXor: aBlock [

	^self xor: aBlock value
]

{ #category : #'*Mutalk-Model' }
Boolean >> nand: alternativeBlock [ 

	^(self and: alternativeBlock) not
]
