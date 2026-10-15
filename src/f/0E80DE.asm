; ---------------------------------------------------------------------------
; HoloBolt_StateAppear - HOLOBOLT first state: play the appear animation (frames 0,1,0,1,2), then activate
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: Obj_SetAnim(Tbl_HoloBoltAnimAppear), +$6C = $FF (until the animation ends), +$5C = HoloBolt_StateActivate; the flare at the core in the TAS screenshot of frame 8150; TAS 8153-9001
; ---------------------------------------------------------------------------
HoloBolt_StateAppear:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$2722(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	HoloBolt_StateActivate(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
