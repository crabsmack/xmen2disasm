; ---------------------------------------------------------------------------
; SyncActor_Init - SYNCHRONIZEDACTOR constructor: parent Init, BBoard index +$8B = placement byte +7, then free the per-object timer (+$7C = 0): the Synchronizer drives these objects instead (class slot 3, +$12)
; In:  8(a6) = this  $C/$10(a6) = x, y (16.16)  $14(a6) = placement entry (not null-checked)
; Out: none
; Evidence: Timer_Free(+$7C); method 3 of class descriptor $119ECA (name string "SYNCHRONIZEDACTOR", parent ACTOR)
; ---------------------------------------------------------------------------
SyncActor_Init:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$2F72(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	move.b	$7(a3),$8B(a4)
	lea.l	$10(a7),a7
	move.l	$7C(a4),-(a7)
	jsr	$4FEA(a5)	; -> Timer_Free
	moveq	#$0,d0
	move.l	d0,$7C(a4)
	addq.w	#$4,a7
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
