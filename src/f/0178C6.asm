; ---------------------------------------------------------------------------
; FarAcolyte_StartOrb - FARACOLYTE slot +$6E (own virtual): start the homing orb 3 px right of and 32 px above itself
; In:  8(a6) = this
; Out: none
; Evidence: tools/classes.py FARACOLYTE +$6E (class derives from ACTOR); orb x/y +$94/+$98, velocity +$9C/+$9E = 0, flags +$92 |= 1, &= ~2; called by FarAcolyte_StateWaitPlayer
; ---------------------------------------------------------------------------
FarAcolyte_StartOrb:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	lea.l	$94(a3),a4
	move.l	$8(a3),d0
	add.l	#$300,d0
	move.l	d0,(a4)
	move.l	$C(a3),d0
	add.l	#$FFFFE000,d0
	move.l	d0,$4(a4)
	clr.l	$A(a4)
	clr.w	$8(a4)
	ori.w	#$1,$92(a3)
	andi.w	#$FFFD,$92(a3)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
