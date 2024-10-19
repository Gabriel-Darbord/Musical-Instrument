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

{ #category : 'system startup' }
MusicalInstrument class >> startUp: resuming [

	| concreteSubclasses instruments |
	resuming ifFalse: [ ^ self ].
	self destroy. "to be sure DSP is destroyed, otherwise image will freeze"
	concreteSubclasses := self allSubclasses reject: #isAbstract.
	instruments := concreteSubclasses collect: #instrument.
	Dsp := instruments sum stereo asDsp.
	Dsp init start.
	concreteSubclasses do: [ :subclass | subclass configure ]
]
