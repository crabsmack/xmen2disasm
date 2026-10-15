; ---------------------------------------------------------------------------
; Zapper_StateLoopAnim0 - ZAPPER state for spawn type 0: loop animation jt $2746A forever
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: sub_1F6296(this, jt $2746A); +$6C = $FF, +$5C = itself; chosen by Zapper_Init
; ---------------------------------------------------------------------------
Zapper_StateLoopAnim0:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$5C2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	Zapper_StateLoopAnim0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
