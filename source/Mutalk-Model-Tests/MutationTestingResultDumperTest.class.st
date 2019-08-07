Class {
	#name : #MutationTestingResultDumperTest,
	#superclass : #TestCase,
	#instVars : [
		'resource'
	],
	#category : #'Mutalk-Model-Tests'
}

{ #category : #accessing }
MutationTestingResultDumperTest class >> packageNamesUnderTest [
	^ #('MuTalk-Model')
]

{ #category : #accessing }
MutationTestingResultDumperTest class >> resources [
	^ {MutationTestingResource}
]

{ #category : #accessing }
MutationTestingResultDumperTest >> mutationEngineGeneralEmptyResult [

	"Returns an empty Mutant Engine General Result."

	^ MutationTestingGeneralResult empty
]

{ #category : #accessing }
MutationTestingResultDumperTest >> mutationEngineGeneralResultWithOneAliveMutant [

	"Returns a Mutant Engine General Result with only one mutant survived."

	^ MutationTestingGeneralResult
		for: ( OrderedCollection with: resource evaluationResultForAliveMutant )
]

{ #category : #accessing }
MutationTestingResultDumperTest >> mutationEngineGeneralResultWithOneKilledMutantByError [

	"Returns a Mutant Engine General Result with only one mutant killed by
	error. "

	^ MutationTestingGeneralResult
		for: ( OrderedCollection with: resource evaluationResultForKilledMutantByError )
]

{ #category : #accessing }
MutationTestingResultDumperTest >> mutationEngineGeneralResultWithOneKilledMutantByFailure [

	"Returns a Mutant Engine General Result with only one mutant killed by
	failure."

	^ MutationTestingGeneralResult
		for: ( OrderedCollection with: resource evaluationResultForKilledMutantByFailure )
]

{ #category : #accessing }
MutationTestingResultDumperTest >> mutationEngineGeneralResultWithOneTerminatedMutant [

	"Returns a Mutant Engine General Result with only one terminated mutant."

	^ MutationTestingGeneralResult
		for: ( OrderedCollection with: resource evaluationResultForTerminatedMutant )
]

{ #category : #accessing }
MutationTestingResultDumperTest >> mutationErrorResult [

	^ MutationTestingErrorResult describedAs: 'Error'
]

{ #category : #building }
MutationTestingResultDumperTest >> setUp [

	resource := MutationTestingResource current
]

{ #category : #testing }
MutationTestingResultDumperTest >> testDumpingEmptyResult [

	"Test the accessors methods for an empty result set"

	| emptyResult |

	emptyResult := self mutationEngineGeneralEmptyResult.
	self
		assert: ( NeoJSONWriter toString: emptyResult )
		equals: '{"numberOfEvaluatedMutants":0,"numberOfKilledMutants":0,"numberOfAliveMutants":0,"numberOfTerminatedMutants":0,"mutationScore":0,"elapsedTime":"0:00:00:00","message":""}'
]

{ #category : #testing }
MutationTestingResultDumperTest >> testDumpingErrorResult [

	"Test the accessors methods for an empty result set"

	| emptyResult |

	emptyResult := self mutationErrorResult.
	self
		assert: ( NeoJSONWriter toString: emptyResult )
		equals: '{"numberOfEvaluatedMutants":0,"numberOfKilledMutants":0,"numberOfAliveMutants":0,"numberOfTerminatedMutants":0,"mutationScore":0,"elapsedTime":"0:00:00:00","message":"Error"}'
]

{ #category : #'testing - printing' }
MutationTestingResultDumperTest >> testDumpingWithOnlyOneAliveMutant [

	"printing a mutation general result with only one alive mutant."

	| oneKilledMutantResult |

	oneKilledMutantResult := self
		mutationEngineGeneralResultWithOneAliveMutant.
	self
		assert: ( NeoJSONWriter toString: oneKilledMutantResult )
		equals:
			'{"numberOfEvaluatedMutants":1,"numberOfKilledMutants":0,"numberOfAliveMutants":1,"numberOfTerminatedMutants":0,"mutationScore":0,"elapsedTime":"0:00:00:00","message":""}'
]

{ #category : #'testing - printing' }
MutationTestingResultDumperTest >> testDumpingWithOnlyOneKilledMutantByError [

	"printing a mutation general result with one mutant killed by error."

	| oneKilledMutantResult |

	oneKilledMutantResult := self
		mutationEngineGeneralResultWithOneKilledMutantByError.
	self
		assert: ( NeoJSONWriter toString: oneKilledMutantResult )
		equals:
			'{"numberOfEvaluatedMutants":1,"numberOfKilledMutants":1,"numberOfAliveMutants":0,"numberOfTerminatedMutants":0,"mutationScore":100,"elapsedTime":"0:00:00:00","message":""}'
]

{ #category : #'testing - printing' }
MutationTestingResultDumperTest >> testDumpingWithOnlyOneKilledMutantByFailure [

	"printing a mutation general result with one mutant killed by failure."

	| oneKilledMutantResult |

	oneKilledMutantResult := self mutationEngineGeneralResultWithOneKilledMutantByFailure.
	self
		assert: ( NeoJSONWriter toString: oneKilledMutantResult )
		equals:
			'{"numberOfEvaluatedMutants":1,"numberOfKilledMutants":1,"numberOfAliveMutants":0,"numberOfTerminatedMutants":0,"mutationScore":100,"elapsedTime":"0:00:00:00","message":""}'
]

{ #category : #'testing - printing' }
MutationTestingResultDumperTest >> testDumpingWithOnlyOneTerminatedMutant [

	"printing a mutation general result with one mutant terminated."

	| oneKilledMutantResult |

	oneKilledMutantResult := self
		mutationEngineGeneralResultWithOneTerminatedMutant.
	self
		assert: ( NeoJSONWriter toString: oneKilledMutantResult )
		equals:
			'{"numberOfEvaluatedMutants":1,"numberOfKilledMutants":0,"numberOfAliveMutants":0,"numberOfTerminatedMutants":1,"mutationScore":100,"elapsedTime":"0:00:00:00","message":""}'
]
