; ---------------------------------------------------------------------------
; Launcher_ClassInit - vtable +$5E: per-level class setup for LAUNCHER: load its resources (SprDef_Add) into class globals
; In:  8(a6) = 0, $C(a6) = long class index in the level class list
; Evidence: slot +$5E of the LAUNCHER descriptor $0BED0C; TAS frames 27879-29685 (2 frames active)
; ---------------------------------------------------------------------------
Launcher_ClassInit:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	jsr	Launcher_Nop6A(pc)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$2362(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,-$3C2A(a5)
	lea.l	$C(a7),a7
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$236A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,-$3C2C(a5)
	addq.w	#$8,a7
	unlk	a6
	rts
