Class {
	#name : 'MusicalTpSampler',
	#superclass : 'MusicalInstrument',
	#classInstVars : [
		'samples'
	],
	#category : 'Musical-Instruments',
	#package : 'Musical',
	#tag : 'Instruments'
}

{ #category : 'instance creation' }
MusicalTpSampler class >> instrument [

	| source |
	source := self sampleFolder.
	samples := source asFileReference children.
	^ TpSampler new
		  name: self instrumentName;
		  pathToFolder: source;
		  yourself
]

{ #category : 'testing' }
MusicalTpSampler class >> isAbstract [

	^ self == MusicalTpSampler
]

{ #category : 'playing' }
MusicalTpSampler class >> play [

	Dsp playNote: 60 prefix: self instrumentName dur: 0.5 seconds
]

{ #category : 'playing' }
MusicalTpSampler class >> playAtRandom [

	Dsp
		setValue: (MusicalRandom nextInteger: samples size) - 1
		parameter: self instrumentName , 'Index'
]

{ #category : 'instance creation' }
MusicalTpSampler class >> sampleFolder [

	self subclassResponsibility
]
