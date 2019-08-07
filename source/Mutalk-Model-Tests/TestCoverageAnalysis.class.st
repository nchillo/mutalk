Class {
	#name : #TestCoverageAnalysis,
	#superclass : #TestCase,
	#category : #'Mutalk-Model-Tests'
}

{ #category : #testing }
TestCoverageAnalysis >> testBugWhenHavingATestResourceSendingToOther [

	"the problem was when sending from a resource a message to another object wich class is going to be considered for coverage"

	| analysis result testCases |

	analysis := CoverageAnalysis
		for:
			( Array
				with: ClassForTestingCoverage
				with: TestResourceClassForTestingCoverage )
		running: TestClassForTestingCoverage suite tests.
	result := analysis run.
	testCases := result
		testCasesThatCovers: ClassForTestingCoverage class >> #aClassCoveredMethod.

	self
		assert:
			( ( testCases collect: [ :each | each selector ] )
				includes: #testCaseThatCoversAClassMethod )
]

{ #category : #testing }
TestCoverageAnalysis >> testCoveredMethods [

	| analysis result |

	analysis := CoverageAnalysis
		for: ( Array with: ClassForTestingCoverage )
		running: TestClassForTestingCoverage suite tests.
	result := analysis run.

	self
		assert:
			( result coveredMethods
				includes: ClassForTestingCoverage >> #aCoveredMethod ).
	self
		deny:
			( result coveredMethods
				includes: ClassForTestingCoverage >> #anUncoveredMethod )
]

{ #category : #testing }
TestCoverageAnalysis >> testGettingTheTestCasesThatCoverAClassMethod [

	| analysis result testCases |

	analysis := CoverageAnalysis
		for: ( Array with: ClassForTestingCoverage )
		running: TestClassForTestingCoverage suite tests.
	result := analysis run.
	testCases := result
		testCasesThatCovers: ClassForTestingCoverage class >> #aClassCoveredMethod.

	self
		assert:
			( ( testCases collect: [ :each | each selector ] )
				includes: #testCaseThatCoversAClassMethod )
]

{ #category : #testing }
TestCoverageAnalysis >> testGettingTheTestCasesThatCoverAMethod [

	| analysis result testCases |

	analysis := CoverageAnalysis
		for: ( Array with: ClassForTestingCoverage )
		running: TestClassForTestingCoverage suite tests.
	result := analysis run.
	testCases := result
		testCasesThatCovers: ClassForTestingCoverage >> #aCoveredMethod.
	self
		assert:
			( ( testCases collect: [ :each | each selector ] )
				includes: #testCase1 ).
	self
		deny:
			( ( testCases collect: [ :each | each selector ] )
				includes: #testCase3 )
]
