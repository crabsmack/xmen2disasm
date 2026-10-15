; ---------------------------------------------------------------------------
; CloneA5_InitShockSprites - CloneA5: set up the two shockwave effect sprites ($FFCC6A/$FFCC7E, art jt[$38F8])
; In:  none
; Out: none
; Evidence: Spr_Init(inst, 1, art, 0, 2, next VRAM tile -$3AB0, 1) twice, advancing -$3AB0; TAS 49257
; Found: link-after-rts
; ---------------------------------------------------------------------------
CloneA5_InitShockSprites:
	link.w	a6,#$0
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	-$3AB0(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$2,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$156A(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	-$3596(a5)
	jsr	$506A(a5)	; -> Spr_Init
	move.w	d0,-$3AB0(a5)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	-$3AB0(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$2,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$156A(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	-$3582(a5)
	jsr	$506A(a5)	; -> Spr_Init
	move.w	d0,-$3AB0(a5)
	unlk	a6
	rts
