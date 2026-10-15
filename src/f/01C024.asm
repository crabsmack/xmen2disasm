; ---------------------------------------------------------------------------
; YoyoAcolyte_ClassInit - per-level class setup: SprDef_Add the yoyo sprite set jt $4CA into -$3CD2 (YOYOACOLYTE override of slot +$5E ClassInit)
; In:  8(a6) = this, $C(a6) = class index
; Out: none
; Evidence: class descriptor YOYOACOLYTE slot +$5E (tools/classes.py); YoyoAcolyte_Draw draws the yoyo from -$3CD2; TAS frames 11770-14117 (2 active)
; ---------------------------------------------------------------------------
YoyoAcolyte_ClassInit:
	link.w	a6,#$0
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$4CA(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,g_YoyoAcolyteSprDef2(a5)
	addq.w	#$8,a7
	unlk	a6
	rts
