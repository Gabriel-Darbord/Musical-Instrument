Class {
	#name : 'MusicalScream',
	#superclass : 'MusicalTpSampler',
	#category : 'Musical-Instruments',
	#package : 'Musical',
	#tag : 'Instruments'
}

{ #category : 'configuring' }
MusicalScream class >> configure [

	Dsp setValue: 0 parameter: 'ScreamIndex'
]

{ #category : 'accessing' }
MusicalScream class >> instrumentName [

	^ 'Scream'
]

{ #category : 'instance creation' }
MusicalScream class >> sampleFolder [

	^ 'pharo-local/samples/scream'
]
