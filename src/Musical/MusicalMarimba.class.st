Class {
	#name : 'MusicalMarimba',
	#superclass : 'MusicalInstrument',
	#category : 'Musical-Instruments',
	#package : 'Musical',
	#tag : 'Instruments'
}

{ #category : 'configuring' }
MusicalMarimba class >> configure [

	Dsp setValue: 80 parameter: 'MarimbaFreq'
]

{ #category : 'instance creation' }
MusicalMarimba class >> instrument [

	^ Marimba new
]

{ #category : 'playing' }
MusicalMarimba class >> play [

	Dsp trig: 'MarimbaTrigger'
]

{ #category : 'initialization' }
MusicalMarimba >> initialize [

	instrument := Marimba new asDsp.
	Dsp setValue: 50 parameter: 'MarimbaFreq'
]

{ #category : 'playing' }
MusicalMarimba >> play [

	Dsp trig: 'MarimbaTrigger'
]
