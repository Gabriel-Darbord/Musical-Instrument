Class {
	#name : 'MusicalScream',
	#superclass : 'MusicalInstrument',
	#category : 'Musical-Instruments',
	#package : 'Musical',
	#tag : 'Instruments'
}

{ #category : 'configuring' }
MusicalScream class >> configure [

	Dsp setValue: 0 parameter: 'ScreamIndex'
]

{ #category : 'instance creation' }
MusicalScream class >> instrument [

	^ TpSampler new
		  name: 'Scream';
		  pathToFolder: 'pharo-local/samples/scream';
		  yourself
]

{ #category : 'playing' }
MusicalScream class >> play [

	Dsp playNote: 60 prefix: 'Scream' dur: 0.5 second
]
