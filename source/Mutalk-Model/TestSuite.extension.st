Extension { #name : #TestSuite }

{ #category : #'*Mutalk-Model' }
TestSuite >> runStoppingOnFirstFailOrError [
    | result |
     result := TestResult new.
    self resources do: [ :res |
        res isAvailable ifFalse: [^res signalInitializationError]].
    [self runStoppingOnFirstFailOrError: result] ensure: [self resources do: [:each | each reset]].
    ^result
]

{ #category : #'*Mutalk-Model' }
TestSuite >> runStoppingOnFirstFailOrError: aResult [

	self tests
		do: [ :each | 
			self changed: each.
			each run: aResult.
			aResult defects size > 0
				ifTrue: [ ^ self ]
			]
]
