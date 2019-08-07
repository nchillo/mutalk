Class {
	#name : #BaselineOfMuTalk,
	#superclass : #BaselineOf,
	#category : 'BaselineOfMuTalk'
}

{ #category : #baselines }
BaselineOfMuTalk >> baseline: spec [

	<baseline>
	spec
		for: #common
		do: [ self
				setUpDependencies: spec;
				baselineMutalk: spec.
			spec
				group: 'Development' with: #('Tests' 'Deployment');
				group: 'CI' with: #('Tests' 'Deployment')
			]
]

{ #category : #baselines }
BaselineOfMuTalk >> baselineMutalk: spec [

	spec
		package: 'Mutalk-Model' with: [ spec requires: #('testCoverage' 'NeoJSON') ];
		package: 'Mutalk-Model-TestResources' with: [ spec requires: #('Mutalk-Model') ];
		package: 'Mutalk-Model-Tests'
			with: [ spec requires: #('Mutalk-Model' 'Mutalk-Model-TestResources') ];
		group: 'Deployment' with: 'Mutalk-Model';
		group: 'Tests' with: 'Mutalk-Model-Tests'.
	spec group: 'default' with: #('Mutalk-Model' 'Mutalk-Model-TestResources' 'Mutalk-Model-Tests')
]

{ #category : #initialization }
BaselineOfMuTalk >> setUpDependencies: spec [

	spec for: #'pharo6.x' do: [ spec group: 'testCoverage' with: #() ].
	spec
		for: #'pharo7.x'
		do: [ spec package: 'TestCoverage'.
			spec group: 'testCoverage' with: #('TestCoverage')
			].
	spec
		for: #'pharo8.x'
		do: [ spec package: 'TestCoverage'.
			spec group: 'testCoverage' with: #('TestCoverage')
			].
	spec
		baseline: 'NeoJSON'
		with: [ spec
				repository: 'github://svenvc/NeoJSON/repository';
				loads: #('core')
			]
]
