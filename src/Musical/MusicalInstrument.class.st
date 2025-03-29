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

	"Initialize the DSP object"
	Dsp := (instruments sum: #instrument) stereo asDsp.
	Dsp init start.

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

	quitting ifFalse: [ ^ self ].
	OTMusicalExampleInstrumentationModule uninstall
]

{ #category : 'system startup' }
MusicalInstrument class >> startUp: resuming [

	resuming ifFalse: [ ^ self ].
	self reinstall
]

{ #category : 'actions' }
MusicalInstrument class >> uninstall [
	"Uninstall all musical instrumentation modules."

	<script>
	OTMusicalInstrumentationModule allSubmodulesDo: [ :module | "Uninstall all modules, we don't know which ones were disabled since installation."
		module uninstall ].
	self destroy "Ensure DSP is destroyed, otherwise image will freeze"
]
