Class {
	#name : #MutationTestingConfigurationTest,
	#superclass : #TestCase,
	#category : #'Mutalk-Model-Tests'
}

{ #category : #tests }
MutationTestingConfigurationTest >> testBuildingDefaultConfiguration [

	| defaultConfiguration |

	defaultConfiguration := MutationTestingConfiguration default.
	self assert: defaultConfiguration generationStrategy equals: AllMutationsGenerationStrategy new.
	self
		assert: defaultConfiguration evaluationStrategy
		equals: AllTestsMethodsRunningMutantEvaluationStrategy new.
	self assert: (defaultConfiguration operators includesAll: MutantOperator contents).
	self assert: defaultConfiguration logger equals: NullMutationTestingAnalysisLogger new
]
