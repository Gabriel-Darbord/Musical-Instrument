Class {
	#name : 'OTMusicalGarbageCollector',
	#superclass : 'OTMethodProxyInstrumentation',
	#category : 'Musical-Example',
	#package : 'Musical-Example'
}

{ #category : 'evaluating' }
OTMusicalGarbageCollector class >> beforeExecutionWithReceiver: receiver arguments: arguments [

	receiver class playMusicalInstrument
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

{ #category : 'matching' }
OTMusicalGarbageCollector class >> packageMatcher [

	^ OTMatcher identicalTo: Behavior package
]
