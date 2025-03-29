Class {
	#name : 'OTMusicalGarbageCollector',
	#superclass : 'AnObsoleteOTMethodProxyInstrumentation',
	#category : 'Musical-Example-Instrumentations',
	#package : 'Musical-Example',
	#tag : 'Instrumentations'
}

{ #category : 'evaluating' }
OTMusicalGarbageCollector class >> beforeExecutionWithReceiver: receiver arguments: arguments [

	MusicalMarimba play
]

{ #category : 'matching' }
OTMusicalGarbageCollector class >> classMatcher [

	^ OTMatcher identicalTo: Behavior
]

{ #category : 'matching' }
OTMusicalGarbageCollector class >> methodMatcher [
	"Runs when a global garbage collection happens, see `Behavior >> #handleFailingBasicNew`"

	^ OTMatcher nameBeginsWith: 'handleFailing'
]

{ #category : 'accessing' }
OTMusicalGarbageCollector class >> musicalInstruments [
	"List of instruments that must be created for this instrumentation to work."

	^ { MusicalMarimba }
]

{ #category : 'matching' }
OTMusicalGarbageCollector class >> packageMatcher [

	^ OTMatcher identicalTo: Behavior package
]
