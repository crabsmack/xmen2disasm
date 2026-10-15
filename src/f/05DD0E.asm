; ---------------------------------------------------------------------------
; Tuskette_StateRemove - TUSKETTE: kill itself
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: slot $52 Kill
; ---------------------------------------------------------------------------
Tuskette_StateRemove:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	move.w	#$FF,$6C(a4)
	lea.l	Tuskette_StateRemove(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
