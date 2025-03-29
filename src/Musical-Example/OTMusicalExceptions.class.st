Class {
	#name : 'OTMusicalExceptions',
	#superclass : 'AnObsoleteOTMethodProxyInstrumentation',
	#category : 'Musical-Example-Instrumentations',
	#package : 'Musical-Example',
	#tag : 'Instrumentations'
}

{ #category : 'evaluating' }
OTMusicalExceptions class >> beforeExecutionWithReceiver: receiver arguments: arguments [
	"on exception, not when debugging"

	receiver exception class == OupsNullException ifFalse: [
		MusicalScream play ]
]

{ #category : 'matching' }
OTMusicalExceptions class >> classMatcher [

	^ OTMatcher identicalTo: OupsDebugRequest
]

{ #category : 'matching' }
OTMusicalExceptions class >> methodMatcher [

	^ OTMatcher name: #submit
]

{ #category : 'accessing' }
OTMusicalExceptions class >> musicalInstruments [

	^ { MusicalScream }
]

{ #category : 'matching' }
OTMusicalExceptions class >> packageMatcher [

	^ OTMatcher identicalTo: OupsDebugRequest package
]
