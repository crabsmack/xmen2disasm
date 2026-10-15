; ---------------------------------------------------------------------------
; XClone_ActUnhittableScript - XCLONE script action: become unhittable (+6 bits 2 and $1000) and switch to script jt[$1B6A]
; In:  8(a6) = this
; Out: none
; Evidence: List_Unlink(+$84, $FFEBAE); AiScript_Set(+$96, jt[$1B6A]), step 0; jt 722; TAS 52266-52535
; Found: jt 722
; ---------------------------------------------------------------------------
XClone_ActUnhittableScript:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$2,d0
	and.w	$6(a4),d0
	bne.s	loc_095A0C
	ori.w	#$2,$6(a4)
	pea.l	-$1652(a5)
	move.l	$84(a4),-(a7)
	jsr	$406A(a5)	; -> List_Unlink
	moveq	#$0,d0
	move.l	d0,$84(a4)
	addq.w	#$8,a7
loc_095A0C:
	ori.w	#$1000,$6(a4)
	lea.l	$196A(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	tst.l	$98(a4)
	addq.w	#$8,a7
	bne.s	loc_095A36
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_095A52
loc_095A36:
	clr.w	$96(a4)
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_095A52:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
