Class {
	#name : 'OTMusicalExampleInstrumentationModule',
	#superclass : 'OTMusicalInstrumentationModule',
	#category : 'Musical-Example',
	#package : 'Musical-Example'
}

{ #category : 'accessing' }
OTMusicalExampleInstrumentationModule class >> instrumentationName [

	^ 'musical-example'
]

{ #category : 'accessing' }
OTMusicalExampleInstrumentationModule class >> instrumentations [

	^ {
		  OTMusicalCollection.
		  OTMusicalGarbageCollector }
]

{ #category : 'accessing' }
OTMusicalExampleInstrumentationModule class >> musicalInstruments [
	"List of instruments that must be created for this instrumentation to work."

	^ {
		  MusicalMarimba.
		  MusicalChordy.
		  MusicalFm2Op.
		  MusicalScream }
]
