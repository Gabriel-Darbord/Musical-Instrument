Class {
	#name : 'MusicalScaled',
	#superclass : 'MusicalInstrument',
	#classInstVars : [
		'scale',
		'index'
	],
	#category : 'Musical-Instruments',
	#package : 'Musical',
	#tag : 'Instruments'
}

{ #category : 'adding' }
MusicalScaled class >> addOctaves: anInteger [

	| newScale scaleIndex |
	newScale := Array new: scale size * (anInteger + 1).
	scaleIndex := 0.
	scale size timesRepeat: [
		newScale
			at: (scaleIndex := scaleIndex + 1)
			put: (scale at: scaleIndex) ].
	1 to: anInteger do: [ :octave |
		1 to: scale size do: [ :i |
			newScale
				at: (scaleIndex := scaleIndex + 1)
				put: 12 * octave + (scale at: i) ] ].
	scale := newScale
]

{ #category : 'adding' }
MusicalScaled class >> addToScale: aCollection [

	scale := scale copyWithAll: aCollection
]

{ #category : 'accessing' }
MusicalScaled class >> instrumentName [

	self subclassResponsibility
]

{ #category : 'testing' }
MusicalScaled class >> isAbstract [

	^ self == MusicalScaled
]

{ #category : 'playing' }
MusicalScaled class >> play [

	Dsp
		playNote: (scale at: 1)
		prefix: self instrumentName
		dur: 0.005 second
]

{ #category : 'playing' }
MusicalScaled class >> play: anInstrumentName [

	Dsp
		playNote: (scale at: 1)
		prefix: anInstrumentName
		dur: 0.005 second
]

{ #category : 'playing' }
MusicalScaled class >> play: anInstrumentName ascending: aScale [

	self play: anInstrumentName ascending: aScale for: 0.005 second
]

{ #category : 'playing' }
MusicalScaled class >> play: anInstrumentName ascending: aScale for: aDuration [

	index := index ifNil: [ 1 ] ifNotNil: [
		         index >= aScale size
			         ifTrue: [ 1 ]
			         ifFalse: [ index + 1 ] ].
	Dsp
		playNote: (aScale at: index)
		prefix: anInstrumentName
		dur: aDuration
]

{ #category : 'playing' }
MusicalScaled class >> play: anInstrumentName atRandom: aScale [

	Dsp
		playNote: (aScale at: (MusicalRandom nextInteger: aScale size))
		prefix: anInstrumentName
		dur: 0.005 second
]

{ #category : 'playing' }
MusicalScaled class >> play: anInstrumentName atRandom: aScale for: aDuration [

	Dsp
		playNote: (aScale at: (MusicalRandom nextInteger: aScale size))
		prefix: anInstrumentName
		dur: aDuration
]

{ #category : 'playing' }
MusicalScaled class >> play: anInstrumentName descending: aScale [

	self play: anInstrumentName descending: aScale for: 0.005 second
]

{ #category : 'playing' }
MusicalScaled class >> play: anInstrumentName descending: aScale for: aDuration [

	index := index ifNil: [ aScale size ] ifNotNil: [
		         (index <= 1 or: [ index > aScale size ])
			         ifTrue: [ aScale size ]
			         ifFalse: [ index - 1 ] ].
	Dsp
		playNote: (aScale at: index)
		prefix: anInstrumentName
		dur: aDuration
]

{ #category : 'playing' }
MusicalScaled class >> play: anInstrumentName for: aDuration [

	Dsp
		playNote: (scale at: (MusicalRandom nextInteger: scale size))
		prefix: anInstrumentName
		dur: aDuration
]

{ #category : 'playing' }
MusicalScaled class >> play: anInstrumentName onScale: aScale [

	Dsp
		playNote: (aScale at: (MusicalRandom nextInteger: aScale size))
		prefix: anInstrumentName
		dur: 0.005 second
]

{ #category : 'playing' }
MusicalScaled class >> play: anInstrumentName onScale: aScale for: aDuration [

	Dsp
		playNote: (aScale at: (MusicalRandom nextInteger: aScale size))
		prefix: anInstrumentName
		dur: aDuration
]

{ #category : 'playing' }
MusicalScaled class >> playAscending [

	self play: self instrumentName ascending: self scale
]

{ #category : 'playing' }
MusicalScaled class >> playAtRandom [

	Dsp
		playNote: (scale at: (MusicalRandom nextInteger: scale size))
		prefix: self instrumentName
		dur: 0.005 second
]

{ #category : 'playing' }
MusicalScaled class >> playAtRandom: aScale [

	self play: self instrumentName atRandom: aScale
]

{ #category : 'playing' }
MusicalScaled class >> playAtRandom: aScale for: aDuration [

	self play: self instrumentName atRandom: aScale for: aDuration
]

{ #category : 'playing' }
MusicalScaled class >> playDescending [

	self play: self instrumentName descending: self scale
]

{ #category : 'playing' }
MusicalScaled class >> playNote: anInteger [

	Dsp playNote: anInteger prefix: self instrumentName dur: 0.005
]

{ #category : 'playing' }
MusicalScaled class >> playNote: anInteger for: aDuration [

	Dsp playNote: anInteger prefix: self instrumentName dur: aDuration
]

{ #category : 'accessing' }
MusicalScaled class >> scale [

	^ scale ifNil: [ scale := MusicalScale cMajor ]
]

{ #category : 'accessing' }
MusicalScaled class >> scale: anIntegerArray [

	scale := anIntegerArray
]

{ #category : 'transposition' }
MusicalScaled class >> transposeScaleByOctaves: anInteger [

	scale := MusicalScale transpose: scale byOctaves: anInteger
]

{ #category : 'transposition' }
MusicalScaled class >> transposeScaleBySemitones: anInteger [

	scale := MusicalScale transpose: scale bySemitones: anInteger
]
