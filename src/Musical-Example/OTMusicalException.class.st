Class {
	#name : 'OTMusicalException',
	#superclass : 'OTMethodProxyInstrumentation',
	#category : 'Musical-Example',
	#package : 'Musical-Example'
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

{ #category : 'matching' }
OTMusicalException class >> packageMatcher [

	^ OTMatcher identicalTo: OupsDebugRequest package
]
