Class {
	#name : 'MusicalDefaultSampler',
	#superclass : 'MusicalTpSampler',
	#category : 'Musical-Instruments',
	#package : 'Musical',
	#tag : 'Instruments'
}

{ #category : 'accessing' }
MusicalDefaultSampler class >> instrumentName [

	^ 'DefaultSampler'
]

{ #category : 'instance creation' }
MusicalDefaultSampler class >> sampleFolder [

	^ 'pharo-local/samples/default'
]
