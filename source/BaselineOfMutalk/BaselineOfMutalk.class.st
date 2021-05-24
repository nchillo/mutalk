Class {
	#name : #BaselineOfMutalk,
	#superclass : #BaselineOf,
	#category : #BaselineOfMutalk
}

{ #category : #baselines }
BaselineOfMutalk >> baseline: spec [

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
BaselineOfMutalk >> baselineMutalk: spec [

	spec
		package: 'Mutalk-Model' with: [ spec requires: #('testCoverage' 'NeoJSON' 'MutalkDrTests') ];
		package: 'Mutalk-Model-TestResources' with: [ spec requires: #('Mutalk-Model') ];
		package: 'Mutalk-Model-Tests'
			with: [ spec requires: #('Mutalk-Model' 'Mutalk-Model-TestResources') ];
		group: 'Deployment' with: 'Mutalk-Model';
		group: 'Tests' with: 'Mutalk-Model-Tests'.
	spec group: 'default' with: #('Mutalk-Model' 'Mutalk-Model-TestResources' 'Mutalk-Model-Tests')
]

{ #category : #initialization }
BaselineOfMutalk >> setUpDependencies: spec [
	spec
		for: #'pharo6.x'
		do: [ spec group: 'testCoverage' with: #().
			spec group: 'MutalkDrTests' with: #() ].
	spec
		for: #'pharo7.x'
		do: [ spec package: 'TestCoverage'.
			spec group: 'testCoverage' with: #('TestCoverage').
			spec group: 'MutalkDrTests' with: #() ].
	spec
		for: #'pharo8.x'
		do: [ spec package: 'TestCoverage'.
			spec package: 'Mutalk-DrTests'.
			spec group: 'testCoverage' with: #('TestCoverage').
			spec group: 'MutalkDrTests' with: #('Mutalk-DrTests') ].
	spec
		for: #'pharo9.x'
		do: [ spec package: 'TestCoverage'.
			spec package: 'Mutalk-DrTests'.
			spec group: 'testCoverage' with: #('TestCoverage').
			spec group: 'MutalkDrTests' with: #('Mutalk-DrTests') ].
	spec
		baseline: 'NeoJSON'
		with: [ spec
				repository: 'github://svenvc/NeoJSON/repository';
				loads: #('core') ]
]
