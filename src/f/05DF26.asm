; ---------------------------------------------------------------------------
; Tuskette_Init_part3 - part 3 of Tuskette_Init: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of Tuskette_Init
; Out: continues in Tuskette_Init
; Evidence: only reached by branches from Tuskette_Init
; ---------------------------------------------------------------------------
Tuskette_Init_part3:
	addq.b	#$1,$42(a4)
	andi.w	#$FFF7,$6(a4)
	andi.b	#$FB,$2E(a4)
	addq.b	#$1,$42(a4)
	lea.l	Tuskette_StateExitLeft(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	bra.w	$5E044
loc_05DF4A:
	addq.b	#$1,$42(a4)
	andi.w	#$FFF7,$6(a4)
	andi.b	#$FB,$2E(a4)
	addq.b	#$1,$42(a4)
	lea.l	Tuskette_StateExitRight(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	bra.w	$5E044
