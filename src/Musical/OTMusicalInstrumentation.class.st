Class {
	#name : 'OTMusicalInstrumentation',
	#superclass : 'OTInstrumentation',
	#category : 'Musical-Instrumentation',
	#package : 'Musical',
	#tag : 'Instrumentation'
}

{ #category : 'testing' }
OTMusicalInstrumentation class >> isAbstract [

	^ self == OTMusicalInstrumentation
]

{ #category : 'instrumenting' }
OTMusicalInstrumentation class >> onMethodEnter: event [
	"The event contains the RFMethodOperation"

	| operation |
	operation := event at: 1.
	operation method methodClass playMusicalInstrument
]
