Class {
	#name : 'BaselineOfMusical',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfMusical',
	#package : 'BaselineOfMusical'
}

{ #category : 'baselines' }
BaselineOfMusical >> baseline: spec [

	spec for: #common do: [
		spec
			baseline: 'Phausto'
			with: [ spec repository: 'github://lucretiomsp/phausto:main/src' ].

		spec package: 'Musical' with: [ spec requires: #( 'Phausto' ) ].

		spec
			group: 'core' with: #( 'Musical' );
			group: 'tests' with: #(  );
			group: 'default' with: #( 'core' 'tests' ) ]
]
