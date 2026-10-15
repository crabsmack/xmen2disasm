; ---------------------------------------------------------------------------
; EvilBeast_ActThrow - EVILBEAST script action: throw (set up the two thrown objects, stop, throw animation)
; In:  8(a6) = this
; Out: d0
; Evidence: Beast_ShockwaveInit(x, +$BA, +$BC, resource record, 0) (Beast code), animation $1829E6, +$6C = $FF; next EvilBeast_StateThrow; jt 767
; Found: jt 767
; ---------------------------------------------------------------------------
EvilBeast_ActThrow:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d7
	asr.l	#$8,d7
	move.l	$C(a4),d6
	asr.l	#$8,d6
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	g_EvilBeastThrowSprDef(a5),d1
	ext.l	d1
	lsl.l	#$2,d1
	move.l	d1,d2
	lsl.l	#$2,d1
	add.l	d2,d1
	lea.l	g_SpriteDefs(a5),a0
	pea.l	(a0,d1.w)
	pea.l	$BC(a4)
	pea.l	$BA(a4)
	ext.l	d7
	move.l	d7,-(a7)
	jsr	$42E2(a5)	; -> Beast_ShockwaveInit
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	lea.l	$14(a7),a7
	lea.l	$4282(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	EvilBeast_StateThrow(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
