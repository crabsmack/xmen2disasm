; ---------------------------------------------------------------------------
; Apocalypse_TakeDamage - vtable +$26: a APOCALYPSE takes a hit
; In:  8(a6) = this (APOCALYPSE object)
; Out: none
; Evidence: class descriptor APOCALYPSE slot +$26 (tools/classes.py); TAS frames 26561-27030 (8 active)
; ---------------------------------------------------------------------------
Apocalypse_TakeDamage:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.w	$8C(a4),d0
	tst.l	d0
	btst	#$0,d0
	beq.s	loc_04CD7C
	moveq	#$7,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	pea.l	($EB).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($EB).w
	jsr	$521A(a5)	; -> Snd_Play
	move.w	#$3C,$6A(a4)
	lea.l	$10(a7),a7
	bra.s	loc_04CD9C
loc_04CD7C:
	tst.l	$60(a4)
	beq.s	loc_04CD8C
	move.l	$60(a4),$5C(a4)
	clr.w	$6C(a4)
loc_04CD8C:
	move.w	#$A,$6A(a4)
	move.b	$17(a6),d0
	ext.w	d0
	sub.w	d0,$68(a4)
loc_04CD9C:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
