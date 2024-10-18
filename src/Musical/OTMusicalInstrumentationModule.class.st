Class {
	#name : 'OTMusicalInstrumentationModule',
	#superclass : 'OTInstrumentationModule',
	#category : 'Musical-Instrumentation',
	#package : 'Musical',
	#tag : 'Instrumentation'
}

{ #category : 'class initialization' }
OTMusicalInstrumentationModule class >> initialize [

	SessionManager default registerUserClassNamed: self name
]

{ #category : 'accessing' }
OTMusicalInstrumentationModule class >> instrumentationName [
	"My subclasses must return a string with the name of the instrumentation module.
	Ideally, the name should be the same as the library being instrumented.
	It must be in lowercase, with words separated by hyphens."

	^ 'musical'
]

{ #category : 'accessing' }
OTMusicalInstrumentationModule class >> instrumentations [
	"My subclasses must return the list of Instrumentations contained in the module."

	^ {
		  OTMusicalCollection.
		  OTMusicalGarbageCollector }
]

{ #category : 'system startup' }
OTMusicalInstrumentationModule class >> shutDown: quitting [

	quitting ifFalse: [ ^ self ].
	self uninstall
	"make sure this instrumentation is uninstalled on shut down
	if a sensitive method is instrumented and an instrument is played on start up
	before the DSP has been created, it can make an endless loop that kills the image
	for example this happens when instrumenting Exception>>#signal:"
]
