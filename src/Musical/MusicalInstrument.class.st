"
The main entry point for installing all instrumentations.
I am responsible for setting up the musical part by initializing the Phausto `DSP` object.
Subclass me to create a custom instrument, and refer it as a required instrument with `musicalInstruments` in your instrumentation to initialize it.
"
Class {
	#name : 'MusicalInstrument',
	#superclass : 'Object',
	#classVars : [
		'Dsp',
		'MusicalRandom'
	],
	#category : 'Musical-Instruments',
	#package : 'Musical',
	#tag : 'Instruments'
}

{ #category : 'configuring' }
MusicalInstrument class >> configure [
	"Subclasses can use this hook to configure their instrument on the DSP after its creation."
]

{ #category : 'initialize - destroy' }
MusicalInstrument class >> destroy [

	(Dsp isNil or: [ Dsp isNull ]) ifTrue: [ ^ self ].
	Dsp stop.
	Dsp destroy.
	Dsp := nil
]

{ #category : 'class initialization' }
MusicalInstrument class >> initialize [

	SessionManager default registerUserClassNamed: self name.
	MusicalRandom := Random new
]

{ #category : 'actions' }
MusicalInstrument class >> initializeDSP: instruments [
	"Avoid using sum: which can create the same instrument multiple times, messing up the parameter names."

	| sample sum |
	sample := instruments anyOne.
	sum := sample instrument.
	instruments do: [ :instrument |
		instrument == sample ifFalse: [ sum := sum + instrument instrument ] ].

	Dsp := sum stereo asDsp.
	Dsp init start
]

{ #category : 'actions' }
MusicalInstrument class >> install [
	"Install all enabled musical instrumentation modules.
	Ask them for their required instruments and initialize the DSP.
	Note: the DSP is not created and the modules not installed if no instruments are required.
	Prefer calling #reinstall for manual handling."

	| modules instruments |
	modules := OrderedCollection new.
	instruments := Set new.
	OTMusicalInstrumentationModule allSubmodulesDo: [ :module |
		module enabled ifTrue: [
			modules add: module.
			instruments addAll: module musicalInstruments ] ].

	instruments ifEmpty: [ ^ self ].
	self initializeDSP: instruments.

	"Let the instruments configure the DSP, and then install the instrumentations."
	instruments do: [ :instrument | instrument configure ].
	modules do: [ :module | module install ]
]

{ #category : 'instance creation' }
MusicalInstrument class >> instrument [

	self subclassResponsibility
]

{ #category : 'accessing' }
MusicalInstrument class >> instrumentName [

	self subclassResponsibility
]

{ #category : 'testing' }
MusicalInstrument class >> isAbstract [

	^ self == MusicalInstrument
]

{ #category : 'playing' }
MusicalInstrument class >> play [

	self subclassResponsibility
]

{ #category : 'actions' }
MusicalInstrument class >> reinstall [
	"Uninstall and reinstall all enabled musical instrumentation modules."

	<script>
	self uninstall.
	self install
]

{ #category : 'system startup' }
MusicalInstrument class >> shutDown: quitting [

	quitting ifTrue: [ self uninstall ]
]

{ #category : 'system startup' }
MusicalInstrument class >> startUp: resuming [

	resuming ifTrue: [ self install ]
]

{ #category : 'actions' }
MusicalInstrument class >> uninstall [
	"Uninstall all musical instrumentation modules."

	<script>
	OTMusicalInstrumentationModule allSubmodulesDo: [ :module | "Uninstall all modules, we don't know which ones were disabled since installation."
		module uninstall ].
	self destroy "Ensure DSP is destroyed, otherwise image can freeze when starting another DSP"
]
