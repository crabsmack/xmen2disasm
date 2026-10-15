; ---------------------------------------------------------------------------
; SpaceA1_RunScene - scene "SpaceA1 Space_Elevator": build the Elevator object on the stack, load and set up the stage, run the level loop with shadow/highlight on
; In:  none
; Out: none
; Evidence: registered by Scene_RegisterAll with the name string at $58EA (jt $2AAA); g_Elevator = $FFC63C; calls Level_Run (level main loop); TAS frame 37205
; ---------------------------------------------------------------------------
SpaceA1_RunScene:
	link.w	a6,#$FF44
	lea.l	-$BC(a6),a0
	move.l	a0,g_Elevator(a5)
	moveq	#$14,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	pea.l	-$BC(a6)
	jsr	$4DB2(a5)	; -> Mem_Set
	lea.l	-$A8(a6),a0
	move.l	a0,-$3BC8(a5)
	pea.l	($A8).w
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	-$A8(a6)
	jsr	$4DB2(a5)	; -> Mem_Set
	lea.l	$2A7A(a5),a0
	movea.l	g_Elevator(a5),a1
	move.l	$2(a0),(a1)
	jsr	SpaceA1_CallEmptyStub(pc)
	jsr	SpaceA1_LoadLevel(pc)
	jsr	SpaceA1_InstallHooks(pc)
	moveq	#$1,d0
	move.l	d0,-(a7)
	jsr	VDP_SetShadowHighlight(pc)
	jsr	$2E8A(a5)	; -> sub_1190D6
	jsr	$5002(a5)	; -> Level_Run
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	VDP_SetShadowHighlight(pc)
	unlk	a6
	rts
