Extension { #name : #Number }

{ #category : #'*Money' }
Number >> asCurrency: aCurrency [ 
	^ Money amount: self currency: aCurrency.
]
