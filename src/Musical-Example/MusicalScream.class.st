Class {
	#name : 'MusicalScream',
	#superclass : 'MusicalTpSampler',
	#category : 'Musical-Example-Instruments',
	#package : 'Musical-Example',
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
	"Will play the first file found in the ./ScreamSample/ folder."

	^ 'ScreamSample'
]
