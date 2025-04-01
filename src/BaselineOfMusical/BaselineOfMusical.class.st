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
		spec postLoadDoIt: #copyLibraries.

		spec
			baseline: 'Phausto'
			with: [ spec repository: 'github://lucretiomsp/phausto:main/src' ];
			baseline: 'OpenTelemetry' with: [
				spec repository:
						'github://Gabriel-Darbord/opentelemetry-pharo:main/src' ];
			baseline: 'GitBridge'
			with: [ spec repository: 'github://jecisc/GitBridge:v1.x.x/src' ].

		spec
			package: 'Musical'
			with: [
				spec requires: #( 'Phausto' 'OpenTelemetry' 'Musical-GitBridge' ) ];
			package: 'Musical-Example' with: [ spec requires: #( 'Musical' ) ];
			package: 'Musical-GitBridge'
			with: [ spec requires: #( 'GitBridge' ) ].

		spec
			group: 'core' with: #( 'Musical' );
			group: 'tests' with: #(  );
			group: 'examples' with: #( 'Musical-Example' );
			group: 'default' with: #( 'core' 'tests' );
			group: 'all' with: #( 'default' 'examples' ) ]
]

{ #category : 'copying' }
BaselineOfMusical >> copyLibraries [
	"Copy the libraries from the Git folder to the image folder."

	MusicalGitBridge sourceDirectory / 'librariesBundle' copyTo:
		(Smalltalk imagePath copyUpToLast: $/) asFileReference
		/ 'librariesBundle'
]
