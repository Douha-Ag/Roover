Class {
	#name : 'Roover',
	#superclass : 'Object',
	#instVars : [
		'x',
		'y',
		'direction',
		'gridSize'
	],
	#category : 'Roover',
	#package : 'Roover'
}

{ #category : 'accessing' }
Roover >> back [

	| p |
	p := self direction back: x @ y.
	(p x < 1 or: [ p y < 1 ]) ifTrue: [ ^ self ].
	x := p x.
	y := p y
]

{ #category : 'accessing' }
Roover >> direction [
	^ direction
]

{ #category : 'accessing' }
Roover >> direction: aWest [ 
	direction := aWest
]

{ #category : 'accessing' }
Roover >> gridSize [
	^ gridSize
]

{ #category : 'accessing' }
Roover >> gridSize: aPoint [ 
	gridSize := aPoint
]

{ #category : 'initialization' }
Roover >> initialize [

	super initialize.
	direction := North new.
	x := 0.
	y := 0
]

{ #category : 'accessing' }
Roover >> interpretCommand: aString [ 
	| input grid |
	input := aString splitOn: Character cr.
	grid := input first splitOn: Character space.
	self gridSize: (grid first asInteger + 1) @
	(grid second asInteger + 1).
	
		
	
]

{ #category : 'accessing' }
Roover >> interpretDirection2: aString [

	aString do: [ :c |
			c = $R
				ifTrue: [ self turnRight ]
				ifFalse: [
						c = $L
							ifTrue: [ self turnLeft ]
							ifFalse: [
									c = $B
										ifTrue: [ self back ]
										ifFalse: [ self move2 ] ] ] ]
]

{ #category : 'accessing' }
Roover >> interpretDirection: aString [

	
	aString do: [ :c |
			c = $R
				ifTrue: [ self turnRight ]
				ifFalse: [
						c = $L
							ifTrue: [ self turnLeft ]
							ifFalse: [ self move ] ] ]
]

{ #category : 'accessing' }
Roover >> interpretFullCommand: aString [

	| temp |
	temp := aString splitOn: Character cr.
	self interpretCommand: temp first.
	self interpretInit: temp second.
	self interpretDirection2: temp third. "pour le back"
	"self interpretDirection: temp third"
]

{ #category : 'accessing' }
Roover >> interpretInit: aString [ 
	| cmd |
	cmd:=aString splitOn: Character space.
	x:=cmd first asInteger.
	y:=cmd second asInteger.
	direction:= Direction fromChar: cmd third 
]

{ #category : 'as yet unclassified' }
Roover >> intialize2 [
	super initialize.
	direction := North new.
	x := 1.
	y := 1.
]

{ #category : 'accessing' }
Roover >> move [
	| p |
	p:= self direction move: x@y.
	x:= p x.
	y:= p y.
	
]

{ #category : 'as yet unclassified' }
Roover >> move2 [

	| p |
	p := self direction move: x @ y.
	((p x > gridSize x or: [ p y > gridSize y ]) or: [(p x < 0 or: [ p y < 0 ])]) ifTrue: [ ^ self ].
	"(p x < 0 or: [ p y < 0 ]) ifTrue: [ ^ self ]."
	x := p x.
	y := p y
]

{ #category : 'accessing' }
Roover >> reCording: aString [

	| liste |
	liste := OrderedCollection new.
	aString do: [ :c |
			c = $R
				ifTrue: [ self turnRight ]
				ifFalse: [
						c = $L
							ifTrue: [ self turnLeft ]
							ifFalse: [
									c = $B
										ifTrue: [ self back ]
										ifFalse: [ self move2 ] ] ].
			liste add:  (self x @ self y)  ].

	^ liste
]

{ #category : 'as yet unclassified' }
Roover >> turnLeft [
	self direction: self direction rotateLeft
]

{ #category : 'accessing' }
Roover >> turnRight [
	self direction: self direction rotateRight .
]

{ #category : 'accessing - structure variables' }
Roover >> x [
	^ x
]

{ #category : 'accessing - structure variables' }
Roover >> y [ 

	^ y
]
