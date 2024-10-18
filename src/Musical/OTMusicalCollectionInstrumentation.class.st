Class {
	#name : 'OTMusicalCollectionInstrumentation',
	#superclass : 'OTMusicalInstrumentation',
	#category : 'Musical-Instrumentation',
	#package : 'Musical',
	#tag : 'Instrumentation'
}

{ #category : 'matching' }
OTMusicalCollectionInstrumentation class >> classMatcher [

	^ OTMatcher anyName: #( Collection SequenceableCollection OrderedCollection )
]

{ #category : 'matching' }
OTMusicalCollectionInstrumentation class >> methodMatcher [
	"My subclasses must define a matcher for the methods to instrument."

	^ OTMatcher anyName: #( do: at: at:put: addLast: addFirst: )
]

{ #category : 'matching' }
OTMusicalCollectionInstrumentation class >> packageMatcher [

	^ OTMatcher plug: [ :package |
		  package name includesSubstring: 'Collection' ]
]
