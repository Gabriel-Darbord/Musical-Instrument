Class {
	#name : 'OTMusicalCollection',
	#superclass : 'OTMusicalInstrumentation',
	#category : 'Musical-Instrumentation',
	#package : 'Musical',
	#tag : 'Instrumentation'
}

{ #category : 'matching' }
OTMusicalCollection class >> classMatcher [

	^ OTMatcher oneOf: {
			  Collection.
			  OrderedCollection }
]

{ #category : 'matching' }
OTMusicalCollection class >> methodMatcher [
	"My subclasses must define a matcher for the methods to instrument."

	^ OTMatcher name: #do:
]

{ #category : 'matching' }
OTMusicalCollection class >> packageMatcher [

	^ OTMatcher oneOf: {
			  Collection package.
			  OrderedCollection package }
]
