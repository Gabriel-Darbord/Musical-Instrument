Class {
	#name : 'MusicalTpSampler',
	#superclass : 'MusicalInstrument',
	#category : 'Musical-Instruments',
	#package : 'Musical',
	#tag : 'Instruments'
}

{ #category : 'instance creation' }
MusicalTpSampler class >> instrument [

	^ TpSampler new
		  pathToFolder: 'pharo-local/samples/default';
		  yourself
]

{ #category : 'playing' }
MusicalTpSampler class >> play [

	Dsp setValue: 16 atRandom parameter: 'TpSamplerIndex'.
	Dsp playNote: 60 prefix: 'TpSampler' dur: 0.5 second
]
