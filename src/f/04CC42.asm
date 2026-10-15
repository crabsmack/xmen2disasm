; ---------------------------------------------------------------------------
; Apocalypse_Update - vtable +$4A: per-frame update of a APOCALYPSE
; In:  8(a6) = this (APOCALYPSE object)
; Out: none
; Evidence: class descriptor APOCALYPSE slot +$4A (tools/classes.py); TAS frames 24088-27245 (3157 active)
; ---------------------------------------------------------------------------
Apocalypse_Update:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$2E(a4),a3
	move.l	a4,-(a7)
	lea.l	$B3A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$4A(a0),a1
	jsr	(a1)
	move.b	$1(a3),d6
	moveq	#$0,d0
	move.b	d6,d0
	cmpi.w	#$FF,d0
	bne.s	loc_04CC96
	move.l	$8(a4),d6
	asr.l	#$8,d6
	move.l	$C(a4),d7
	asr.l	#$8,d7
	move.w	d6,$56(a4)
	move.w	d7,$54(a4)
	move.w	d6,$5A(a4)
	move.w	d7,d0
	sub.w	#$64,d0
	move.w	d0,$58(a4)
loc_04CC96:
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
