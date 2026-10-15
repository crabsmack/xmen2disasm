; ---------------------------------------------------------------------------
; Gambit_StateThrow - throw dispatcher: on the ground wait 5 frames then Gambit_GroundThrow; in the air Gambit_AirThrow
; In:  8(a6) = player
; Out: d0 = +4 & 8 or the Gambit_AirThrow result
; Evidence: set as +$5C by every aim state once A is released
; ---------------------------------------------------------------------------
Gambit_StateThrow:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.s	loc_1CFB3A
	lea.l	Gambit_AirThrow(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Gambit_AirThrow(pc)
	addq.w	#$4,a7
	bra.s	loc_1CFB4E
loc_1CFB3A:
	move.w	#$5,$6C(a4)
	lea.l	Gambit_GroundThrow(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1CFB4E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
