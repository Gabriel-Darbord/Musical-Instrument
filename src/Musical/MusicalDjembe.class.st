Class {
	#name : 'MusicalDjembe',
	#superclass : 'MusicalModalPercussionInstrument',
	#category : 'Musical-Instruments',
	#package : 'Musical',
	#tag : 'Instruments'
}

{ #category : 'instance creation' }
MusicalDjembe class >> instrument [

	^ Djembe new
]

{ #category : 'accessing' }
MusicalDjembe class >> instrumentName [

	^ 'Djembe'
]
