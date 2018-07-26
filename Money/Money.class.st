Class {
	#name : #Money,
	#superclass : #Object,
	#instVars : [
		'amount',
		'currency'
	],
	#category : #Money
}

{ #category : #factory }
Money class >> amount: aNumber currency: aCurrency [ 
	^ self new amount: aNumber; currency: aCurrency; yourself.
]

{ #category : #'math functions' }
Money >> + addend [ 
	^ Money amount: amount + (addend as: currency) amount
	        currency: currency.
]

{ #category : #accessors }
Money >> amount [
	^ amount
]

{ #category : #accessors }
Money >> amount: aNumber [ 
	amount := aNumber.
]

{ #category : #conversion }
Money >> asCurrency: aCurrency [ 
	^ amount * (currency conversionRates at: aCurrency code) as: aCurrency.
]

{ #category : #accessors }
Money >> currency: aCurrency [ 
	currency := aCurrency.
]

{ #category : #printing }
Money >> printOn: aStream [
	aStream
		nextPutAll: (amount printShowingDecimalPlaces: 2);
		nextPutAll: ' ';
		nextPutAll: currency printString.
]
