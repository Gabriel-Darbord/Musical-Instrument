Class {
	#name : 'OTMusicalException',
	#superclass : 'OTMusicalInstrumentation',
	#category : 'Musical-Instrumentation',
	#package : 'Musical',
	#tag : 'Instrumentation'
}

{ #category : 'evaluating' }
OTMusicalException class >> beforeExecutionWithReceiver: receiver arguments: arguments [
	"on exception, not when debugging"

	receiver exception class == OupsNullException ifFalse: [
		receiver class playMusicalInstrument ]
]

{ #category : 'matching' }
OTMusicalException class >> classMatcher [

	^ OTMatcher identicalTo: OupsDebugRequest
]

{ #category : 'matching' }
OTMusicalException class >> methodMatcher [

	^ OTMatcher name: #submit
]
