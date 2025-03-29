Class {
	#name : 'BaselineOfMusical',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfMusical',
	#package : 'BaselineOfMusical'
}

{ #category : 'baselines' }
BaselineOfMusical >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec
			baseline: 'Phausto'
			with: [ spec repository: 'github://lucretiomsp/phausto:main/src' ];
			baseline: 'OpenTelemetry' with: [
				spec repository:
						'github://Gabriel-Darbord/opentelemetry-pharo:main/src' ].

		spec
			package: 'Musical'
			with: [ spec requires: #( 'Phausto' 'OpenTelemetry' ) ];
			package: 'Musical-Example' with: [ spec requires: #( 'Musical' ) ].

		spec
			group: 'core' with: #( 'Musical' );
			group: 'tests' with: #(  );
			group: 'examples' with: #( 'Musical-Example' );
			group: 'default' with: #( 'core' 'tests' );
			group: 'all' with: #( 'default' 'examples' ) ]
]
