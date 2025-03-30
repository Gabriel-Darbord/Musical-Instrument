Class {
	#name : 'OTMusicalExampleInstrumentationModule',
	#superclass : 'OTMusicalInstrumentationModule',
	#category : 'Musical-Example-InstrumentationModule',
	#package : 'Musical-Example',
	#tag : 'InstrumentationModule'
}

{ #category : 'accessing' }
OTMusicalExampleInstrumentationModule class >> instrumentations [

	^ {
		  "OTMusicalExceptions." "Uncomment when you set up a sample to play"
		  OTMusicalCollections.
		  OTMusicalGarbageCollector }
]

{ #category : 'examples' }
OTMusicalExampleInstrumentationModule class >> start [

	<example>
	self enable
]

{ #category : 'examples' }
OTMusicalExampleInstrumentationModule class >> stop [

	<example>
	self disable
]
