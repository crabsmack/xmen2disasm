; ---------------------------------------------------------------------------
; LightBeam_ClassInit - per-level class setup: LightBeam_NopStatic, SprDef_Add sprite set jt $109A into -$3C5C and keep its VRAM tile base in -$3B10 (LIGHTBEAM override of slot +$5E ClassInit)
; In:  8(a6) = this, $C(a6) = class index
; Out: none
; Evidence: class descriptor LIGHTBEAM slot +$5E (tools/classes.py); TAS frames 45409-45409 (1 active)
; ---------------------------------------------------------------------------
LightBeam_ClassInit:
	link.w	a6,#$0
	jsr	LightBeam_NopStatic(pc)
	moveq	#$2,d0
	move.l	d0,-(a7)
	lea.l	$109A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,g_TextWinBottom(a5)
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_SpriteDefs(a5),a0
	move.w	$6(a0,d0.w),g_SceneVar3B10(a5)
	unlk	a6
	rts
