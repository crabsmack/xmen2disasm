; ---------------------------------------------------------------------------
; Exodus_InitSpawnRec - vtable +$0A: set up the spawn record of a EXODUS
; In:  8(a6) = this (EXODUS object)
; Out: none
; Evidence: class descriptor EXODUS slot +$0A (tools/classes.py); TAS frames 17145-17145 (1 active)
; ---------------------------------------------------------------------------
Exodus_InitSpawnRec:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$67A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$A(a0),a1
	jsr	(a1)
	ori.b	#$8,$4(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
