Class {
	#name : 'MusicalScale',
	#superclass : 'Object',
	#category : 'Musical-Instruments',
	#package : 'Musical',
	#tag : 'Instruments'
}

{ #category : 'scales' }
MusicalScale class >> blues [
	"Blues scale on C"

	^ #( 60 63 65 66 67 70 )
]

{ #category : 'scales' }
MusicalScale class >> cMajor [
	"C Major scale (basic, happy sound)"

	^ #( 60 62 64 65 67 69 71 )
]

{ #category : 'scales' }
MusicalScale class >> cMajor7 [
	"C Major 7 chord (commonly used in jazz, bright and smooth)"

	^ #( 60 64 67 71 )
]

{ #category : 'scales' }
MusicalScale class >> cMinor [
	"C Minor scale (darker, emotional sound)"

	^ #( 60 62 63 65 67 68 70 )
]

{ #category : 'scales' }
MusicalScale class >> cMinor7 [
	"C Minor 7 chord (jazzier, more mellow)"

	^ #( 60 63 67 70 )
]

{ #category : 'scales' }
MusicalScale class >> dorian [
	"Dorian mode on C"

	^ #( 60 62 63 65 67 69 70 )
]

{ #category : 'transposition' }
MusicalScale class >> transpose: aScale byOctaves: anInteger [
	"Transpose each note of a scale by a number of octaves (by 12 semitones).
	The default C scale starts at 48 (C3)."

	| semitones |
	semitones := anInteger * 12.
	^ aScale collect: [ :note | note + semitones ]
]

{ #category : 'transposition' }
MusicalScale class >> transpose: aScale bySemitones: anInteger [
	"Transpose each note of a scale by a number of semitones.
	The default C scale starts at 48 (C3)."

	^ aScale collect: [ :note | note + anInteger ]
]
