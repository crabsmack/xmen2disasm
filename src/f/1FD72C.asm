; ---------------------------------------------------------------------------
; Art_LoadNemToVram - decode a Nemesis art blob (type 4) straight to VRAM at a tile index
; In:  8(a6) = art blob {word 4, word rows, code pairs..., data}  $E(a6) = word VRAM tile
; Out: d0
; Evidence: Nem_BuildCodeTable(blob+4, local 512-byte table), Nem_Decode(..., rows, 1, tile << 5); callers Cerebro_PlayIntro, Failure_RunScene
; ---------------------------------------------------------------------------
Art_LoadNemToVram:
	link.w	a6,#$FE00
	movem.l	d7/a3-a4,-(a7)
	lea.l	-$200(a6),a3
	movea.l	$8(a6),a4
	move.w	(a4),d7
	move.w	d7,d0
	subq.w	#$4,d0
	bne.s	loc_1FD774
	move.w	$2(a4),d7
	move.l	a3,-(a7)
	move.l	a4,d0
	addq.l	#$4,d0
	move.l	d0,-(a7)
	jsr	$4112(a5)	; -> Nem_BuildCodeTable
	movea.l	d0,a4
	move.w	$E(a6),d0
	ext.l	d0
	lsl.l	#$5,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	jsr	$4102(a5)	; -> Nem_Decode
	lea.l	$1C(a7),a7
loc_1FD774:
	movem.l	-$20C(a6),d7/a3-a4
	unlk	a6
	rts
