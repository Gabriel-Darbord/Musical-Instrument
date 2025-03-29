Class {
	#name : 'OTMusicalCollections',
	#superclass : 'AnObsoleteOTMethodProxyInstrumentation',
	#category : 'Musical-Example-Instrumentations',
	#package : 'Musical-Example',
	#tag : 'Instrumentations'
}

{ #category : 'evaluating' }
OTMusicalCollections class >> beforeExecutionWithReceiver: receiver arguments: arguments [

	receiver class playMusicalInstrument
]

{ #category : 'matching' }
OTMusicalCollections class >> classMatcher [

	^ OTMatcher oneOf: {
			  Collection.
			  OrderedCollection }
]

{ #category : 'matching' }
OTMusicalCollections class >> methodMatcher [

	^ OTMatcher anyName: #( select: collect: )
]

{ #category : 'accessing' }
OTMusicalCollections class >> musicalInstruments [
	"List of instruments that must be created for this instrumentation to work."

	^ {
		  MusicalChordy.
		  MusicalFm2Op }
]

{ #category : 'matching' }
OTMusicalCollections class >> packageMatcher [

	^ OTMatcher oneOf: {
			  Collection package.
			  OrderedCollection package }
]
