; ---------------------------------------------------------------------------
; loc_064868
; ---------------------------------------------------------------------------
loc_064868:
	moveq	#$0,d0
	movea.l	d0,a4
	move.w	#$FF,d7
	move.l	a4,d0
	beq.s	loc_064890
	move.l	-$C9A(a5),-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	jsr	$50AA(a5)	; -> sub_1FC35C
	move.l	-$C9A(a5),-(a7)
	move.l	a3,-(a7)
	jsr	sub_064588(pc)
	lea.l	$14(a7),a7
loc_064890:
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
