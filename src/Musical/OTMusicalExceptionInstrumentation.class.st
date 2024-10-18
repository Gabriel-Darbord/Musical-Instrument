Class {
	#name : 'OTMusicalExceptionInstrumentation',
	#superclass : 'OTMusicalInstrumentation',
	#category : 'Musical-Instrumentation',
	#package : 'Musical',
	#tag : 'Instrumentation'
}

{ #category : 'matching' }
OTMusicalExceptionInstrumentation class >> classMatcher [
	"Matches all classes by default.
	Subclasses should redefine this method to focus the search on interesting classes."

	^ OTMatcher subclassesOf: Exception
]

{ #category : 'matching' }
OTMusicalExceptionInstrumentation class >> methodMatcher [

	^ OTMatcher plug: [ :method |
		  method selector includesSubstring: 'signal' ]
]

{ #category : 'instrumenting' }
OTMusicalExceptionInstrumentation class >> onMethodEnter: event [

	| operation |
	operation := event at: 1.
	"on exception, not when debugging"
	operation receiver exception class == OupsNullException ifFalse: [
		operation method methodClass playMusicalInstrument ]
]
