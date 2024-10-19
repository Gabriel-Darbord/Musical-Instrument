Class {
	#name : 'MusicalModalPercussionInstrument',
	#superclass : 'MusicalInstrument',
	#category : 'Musical-Instruments',
	#package : 'Musical',
	#tag : 'Instruments'
}

{ #category : 'testing' }
MusicalModalPercussionInstrument class >> isAbstract [

	^ self == MusicalModalPercussionInstrument
]

{ #category : 'playing' }
MusicalModalPercussionInstrument class >> play [

	Dsp trig: self instrumentName , 'Trigger'
]

{ #category : 'playing' }
MusicalModalPercussionInstrument class >> playFrequency: anInteger [

	| instrumentName |
	instrumentName := self instrumentName.
	Dsp setValue: anInteger parameter: instrumentName , 'Freq'.
	Dsp trig: instrumentName , 'Trigger'
]
