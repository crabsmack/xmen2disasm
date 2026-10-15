; ---------------------------------------------------------------------------
; Tusk_Defeated - TUSK defeated: end the scene after 200 frames (then a constant switch)
; In:  8(a6) = this
; Out: none
; Evidence: called from Tusk_TakeDamage; g_SceneExitTimer = 200; switch Sw_05CCDA on the constant 3
; ---------------------------------------------------------------------------
Tusk_Defeated:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$C8,g_SceneExitTimer(a5)
	moveq	#$3,d0
	bmi.s	Tusk_Defeated_part1
	cmpi.l	#$4,d0
	bgt.s	Tusk_Defeated_part1
	add.l	d0,d0
	move.w	Sw_05CCDA(pc,d0.l),d0
	jmp	Sw_05CCDA-2(pc,d0.w)
