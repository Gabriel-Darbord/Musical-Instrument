Class {
	#name : 'OTMusicalCollection',
	#superclass : 'OTMethodProxyInstrumentation',
	#category : 'Musical-Example',
	#package : 'Musical-Example'
}

{ #category : 'evaluating' }
OTMusicalCollection class >> beforeExecutionWithReceiver: receiver arguments: arguments [

	receiver class playMusicalInstrument
]

{ #category : 'matching' }
OTMusicalCollection class >> classMatcher [

	^ OTMatcher oneOf: {
			  Collection.
			  OrderedCollection }
]

{ #category : 'matching' }
OTMusicalCollection class >> methodMatcher [

	^ OTMatcher name: #do:
]

{ #category : 'matching' }
OTMusicalCollection class >> packageMatcher [

	^ OTMatcher oneOf: {
			  Collection package.
			  OrderedCollection package }
]
