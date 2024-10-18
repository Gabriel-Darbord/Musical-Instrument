Class {
	#name : 'MusicalMarimba',
	#superclass : 'MusicalModalPercussionInstrument',
	#category : 'Musical-Instruments',
	#package : 'Musical',
	#tag : 'Instruments'
}

{ #category : 'configuring' }
MusicalMarimba class >> configure [

	Dsp setValue: 60 parameter: 'MarimbaFreq'
]

{ #category : 'instance creation' }
MusicalMarimba class >> instrument [

	^ Marimba new
]

{ #category : 'playing' }
MusicalMarimba class >> play [

	Dsp trig: 'MarimbaTrigger'
]
