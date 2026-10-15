; ---------------------------------------------------------------------------
; ApocBomb_ClassInit - vtable +$5E: per-level class setup for APOCBOMB (load its resources)
; In:  8(a6) = this, $C(a6) = class index
; Out: none
; Evidence: class descriptor APOCBOMB slot +$5E (tools/classes.py); TAS frames 24044-24044 (1 active)
; ---------------------------------------------------------------------------
ApocBomb_ClassInit:
	link.w	a6,#$0
	jsr	sub_04DF28(pc)
	moveq	#$2,d0
	move.l	d0,-(a7)
	lea.l	$B42(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> sub_1F62C0
	move.w	d0,-$3C6E(a5)
	jsr	sub_04DF92(pc)
	unlk	a6
	rts
