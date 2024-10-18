Class {
	#name : 'OTMusicalException',
	#superclass : 'OTMusicalInstrumentation',
	#category : 'Musical-Instrumentation',
	#package : 'Musical',
	#tag : 'Instrumentation'
}

{ #category : 'matching' }
OTMusicalException class >> classMatcher [

	^ OTMatcher identicalTo: OupsDebugRequest
]

{ #category : 'matching' }
OTMusicalException class >> methodMatcher [

	^ OTMatcher name: #submit
]

{ #category : 'instrumenting' }
OTMusicalException class >> onMethodEnter: event [

	| operation |
	operation := event at: 1.
	"on exception, not when debugging"
	operation receiver exception class == OupsNullException ifFalse: [
		operation method methodClass playMusicalInstrument ]
]
