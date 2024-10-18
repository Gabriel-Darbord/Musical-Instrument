Class {
	#name : 'OTMusicalGarbageCollectorInstrumentation',
	#superclass : 'OTMusicalInstrumentation',
	#category : 'Musical-Instrumentation',
	#package : 'Musical',
	#tag : 'Instrumentation'
}

{ #category : 'matching' }
OTMusicalGarbageCollectorInstrumentation class >> classMatcher [

	^ OTMatcher identicalTo: Behavior
]

{ #category : 'matching' }
OTMusicalGarbageCollectorInstrumentation class >> methodMatcher [
	"runs when a global garbage collection happens, see `Behavior >> #handleFailingBasicNew`"

	^ OTMatcher nameBeginsWith: 'handleFailing'
]

{ #category : 'matching' }
OTMusicalGarbageCollectorInstrumentation class >> packageMatcher [

	^ OTMatcher identicalTo: Behavior package
]
