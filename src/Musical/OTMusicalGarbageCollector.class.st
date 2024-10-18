Class {
	#name : 'OTMusicalGarbageCollector',
	#superclass : 'OTMusicalInstrumentation',
	#category : 'Musical-Instrumentation',
	#package : 'Musical',
	#tag : 'Instrumentation'
}

{ #category : 'matching' }
OTMusicalGarbageCollector class >> classMatcher [

	^ OTMatcher identicalTo: Behavior
]

{ #category : 'matching' }
OTMusicalGarbageCollector class >> methodMatcher [
	"runs when a global garbage collection happens, see `Behavior >> #handleFailingBasicNew`"

	^ OTMatcher nameBeginsWith: 'handleFailing'
]

{ #category : 'matching' }
OTMusicalGarbageCollector class >> packageMatcher [

	^ OTMatcher identicalTo: Behavior package
]
