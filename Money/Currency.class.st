Class {
	#name : #Currency,
	#superclass : #Object,
	#instVars : [
		'code',
		'conversionRates'
	],
	#category : #Money
}

{ #category : #factory }
Currency class >> forCode: aString [ 
	^ self new code: aString.
]

{ #category : #accessors }
Currency >> code [
	^ code
]

{ #category : #accessors }
Currency >> code: aString [ 
	code := aString.
]

{ #category : #conversionRate }
Currency >> conversionInto: aCurrency is: aNumber. [ 
	self conversionRates at: aCurrency code put: 1.0 * aNumber.
	aCurrency conversionRates at: self code put: 1.0 / aNumber.
]

{ #category : #accessors }
Currency >> conversionRates [
	^ conversionRates.
]

{ #category : #accessors }
Currency >> initialize [
	conversionRates := Dictionary new.
]

{ #category : #factory }
Currency >> newFrom: anAmount [ 
	^ anAmount asCurrency: self.
]

{ #category : #printing }
Currency >> printOn: aStream [
  aStream nextPutAll: code.
]
