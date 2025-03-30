"
Subclass me to define a new instrumentation that can play sounds using Phausto.
When I am enabled, `MusicalInstrument` will ask for the instruments I need to initialize in its DSP object.
"
Class {
	#name : 'OTMusicalInstrumentationModule',
	#superclass : 'OTInstrumentationModule',
	#category : 'Musical-Instrumentation',
	#package : 'Musical',
	#tag : 'Instrumentation'
}

{ #category : 'protocol' }
OTMusicalInstrumentationModule class >> disable [
	"Use on a concrete subclass of OTMusicalInstrumentationModule"

	<script>
	self enabled: false.
	MusicalInstrument reinstall
]

{ #category : 'protocol' }
OTMusicalInstrumentationModule class >> enable [
	"Use on a concrete subclass of OTMusicalInstrumentationModule"

	<script>
	self enabled: true.
	MusicalInstrument reinstall
]

{ #category : 'accessing' }
OTMusicalInstrumentationModule class >> instrumentationName [
	"Only useful when exporting spans, otherwise no need to override"

	^ 'musical'
]

{ #category : 'testing' }
OTMusicalInstrumentationModule class >> isAbstract [

	^ self == OTMusicalInstrumentationModule
]

{ #category : 'accessing' }
OTMusicalInstrumentationModule class >> musicalInstruments [
	"List of instruments that must be created for this instrumentation to work.
	By default, ask the instrumentations to supply their own requirements."

	^ self instrumentations flatCollect: #musicalInstruments
]
