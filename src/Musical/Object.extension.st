Extension { #name : 'Object' }

{ #category : '*Musical' }
Object class >> playMusicalInstrument [
	"Play a simple C4 note"

	MusicalChordy playNote: 60
]

{ #category : '*Musical' }
Object >> playMusicalInstrument [

	self class playMusicalInstrument
]
