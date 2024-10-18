Class {
	#name : 'MusicalChordy',
	#superclass : 'MusicalScaled',
	#category : 'Musical-Instruments',
	#package : 'Musical',
	#tag : 'Instruments'
}

{ #category : 'instance creation' }
MusicalChordy class >> instrument [

	^ Chordy new
]

{ #category : 'accessing' }
MusicalChordy class >> instrumentName [

	^ 'Chordy'
]
