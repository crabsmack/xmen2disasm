; ---------------------------------------------------------------------------
; DropBomb_StateStart - DROPBOMB state: set the waiting animation, go to DropBomb_StateWaitInView
; In:  8(a6) = this
; Out: d0 = this+4 & 8
; Evidence: first +$5C handler set by DropBomb_Init; Obj_ChangeAnim(this, Tbl_DropBombAnimWait); +$6C timer := 0
; Found: link-after-rts
; ---------------------------------------------------------------------------
DropBomb_StateStart:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$1192(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	DropBomb_StateWaitInView(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
