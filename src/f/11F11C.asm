; ---------------------------------------------------------------------------
; BioBalls_StateAnimA - BIOBALLS: play animation $11E764 for up to 255 frames, then clear it
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: Obj_SetAnim; next BioBalls_ActClearAnim
; ---------------------------------------------------------------------------
BioBalls_StateAnimA:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$32EA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	BioBalls_ActClearAnim(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
