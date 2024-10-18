Class {
	#name : 'BaselineOfMusicalInstrument',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfMusicalInstrument',
	#package : 'BaselineOfMusicalInstrument'
}

{ #category : 'baselines' }
BaselineOfMusicalInstrument >> baseline: spec [

	spec for: #common do: [
		spec package: 'Musical'.

		spec
			group: 'core' with: #( 'Musical' );
			group: 'tests' with: #(  );
			group: 'default' with: #( 'core' 'tests' ) ]
]
