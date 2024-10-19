Class {
	#name : 'OTMusicalInstrumentation',
	#superclass : 'OTMethodProxyInstrumentation',
	#category : 'Musical-Instrumentation',
	#package : 'Musical',
	#tag : 'Instrumentation'
}

{ #category : 'evaluating' }
OTMusicalInstrumentation class >> beforeExecutionWithReceiver: receiver arguments: arguments [

	receiver class playMusicalInstrument
]

{ #category : 'testing' }
OTMusicalInstrumentation class >> isAbstract [

	^ self == OTMusicalInstrumentation
]
