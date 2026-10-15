; ---------------------------------------------------------------------------
; MagnetoBoss_StateSpin - MAGNETOBOSS: each time the spin animation ends flip horizontally and replay it
; In:  8(a6) = this
; Out: none
; Evidence: +$44 animation pointer == 0 -> +$2E ^= $10, Obj_ChangeAnim(jt $942)
; ---------------------------------------------------------------------------
MagnetoBoss_StateSpin:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$44(a4)
	bne.s	loc_0379C2
	eori.b	#$10,$2E(a4)
	lea.l	$742(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
loc_0379C2:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
