; ---------------------------------------------------------------------------
; Scene_RegisterAll - register every scene (Cerebro screens and stage parts) by name + entry function, storing the returned scene ids
; In:  none
; Out: none (byte globals -$3B70..-$3B4C etc. = scene ids)
; Evidence: calls Scene_Register(name, fn) ~50 times with Str_SiberiaB1Blizzard, Str_CerebroScreenPlayerSelect...; Scene_Register appends {name, fn} to g_SceneTable and returns the index
; ---------------------------------------------------------------------------
Scene_RegisterAll:
	link.w	a6,#$0
	pea.l	$298A(a5)
	pea.l	Str_SiberiaB1Blizzard(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnSiberiaB1(a5)
	pea.l	$E92(a5)
	pea.l	Str_CerebroScreenSentinels(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnCerebroSentinels(a5)
	pea.l	$2412(a5)
	pea.l	Str_SentinelsD1Exterior1(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnSentinelsD1(a5)
	pea.l	$EC2(a5)
	pea.l	Str_CerebroScreenPlayerSelect(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnPlayerSelect(a5)
	pea.l	$2932(a5)
	pea.l	Str_SentinelsB1Exterior3(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnSentinelsB1(a5)
	pea.l	$EC2(a5)
	pea.l	Str_CerebroScreenPlayerSelect_005BE8(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnPlayerSelect(a5)
	pea.l	$262A(a5)
	pea.l	Str_SentinelsA1CoolantCore(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnSentinelsA1(a5)
	pea.l	$294A(a5)
	pea.l	Str_SentinelsB2ExteriorEscape(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnSentinelsB2(a5)
	pea.l	$E9A(a5)
	pea.l	Str_CerebroScreenAvalon(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnCerebroAvalon(a5)
	pea.l	$BA(a5)
	pea.l	Str_AvalonB1Exterior(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnAvalonB1(a5)
	pea.l	$EC2(a5)
	pea.l	Str_CerebroScreenPlayerSelect_005B70(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnPlayerSelect(a5)
	pea.l	$4FA(a5)
	pea.l	Str_AvalonB2InnerShell(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnAvalonB2(a5)
	pea.l	$EC2(a5)
	pea.l	Str_CerebroScreenPlayerSelect_005B40(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnPlayerSelect(a5)
	pea.l	$502(a5)
	pea.l	Str_AvalonA2FallingRoom(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnAvalonA2(a5)
	pea.l	$EC2(a5)
	pea.l	Str_CerebroScreenPlayerSelect_005B0E(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnPlayerSelect(a5)
	pea.l	$60A(a5)
	pea.l	Str_AvalonA3Exodus(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnAvalonA3(a5)
	pea.l	$EC2(a5)
	pea.l	Str_CerebroScreenPlayerSelect_005AE2(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnPlayerSelect(a5)
	pea.l	$732(a5)
	pea.l	Str_AvalonA4ThroneRoom(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnAvalonA4(a5)
	pea.l	$EA2(a5)
	pea.l	Str_CerebroScreenBaniMaza(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnCerebroBaniMaza(a5)
	pea.l	$CAA(a5)
	pea.l	Str_BaniMazaB2Exterior(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnBaniMazaB2(a5)
	pea.l	$EC2(a5)
	pea.l	Str_CerebroScreenPlayerSelect_005A84(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnPlayerSelect(a5)
	pea.l	$82A(a5)
	pea.l	Str_BaniMazaA1MovingBlocks(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnBaniMazaA1(a5)
	pea.l	$EC2(a5)
	pea.l	Str_CerebroScreenPlayerSelect_005A4E(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnPlayerSelect(a5)
	pea.l	$9B2(a5)
	pea.l	Str_BaniMazaA2ApocalypseBoss(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnBaniMazaA2(a5)
	pea.l	$EAA(a5)
	pea.l	Str_CerebroScreenSavage(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnCerebroSavage(a5)
	pea.l	$2312(a5)
	pea.l	Str_SavageC1Jungle1(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnSavageC1(a5)
	pea.l	$EC2(a5)
	pea.l	Str_CerebroScreenPlayerSelect_0059F0(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnPlayerSelect(a5)
	pea.l	$231A(a5)
	pea.l	Str_SavageB1Jungle2(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnSavageB1(a5)
	pea.l	$EC2(a5)
	pea.l	Str_CerebroScreenPlayerSelect_0059C2(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnPlayerSelect(a5)
	pea.l	$1C22(a5)
	pea.l	Str_SavageA2Perimeter1(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnSavageA2(a5)
	pea.l	$EC2(a5)
	pea.l	Str_CerebroScreenPlayerSelect_005990(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnPlayerSelect(a5)
	pea.l	$1C72(a5)
	pea.l	Str_SavageA3Perimeter2(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnSavageA3(a5)
	pea.l	$EC2(a5)
	pea.l	Str_CerebroScreenPlayerSelect_00595E(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnPlayerSelect(a5)
	pea.l	$1CA2(a5)
	pea.l	Str_SavageA4Chamber(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnSavageA4(a5)
	pea.l	$EB2(a5)
	pea.l	Str_CerebroScreenSpace(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnCerebroSpace(a5)
	pea.l	$2A22(a5)
	pea.l	Str_SpaceB1MaintenanceShaft(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnSpaceB1(a5)
	pea.l	$EC2(a5)
	pea.l	Str_CerebroScreenPlayerSelect_005902(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnPlayerSelect(a5)
	pea.l	$2AAA(a5)
	pea.l	Str_SpaceA1SpaceElevator(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnSpaceA1(a5)
	pea.l	$EBA(a5)
	pea.l	Str_CerebroScreenClone(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnCerebroClone(a5)
	pea.l	$10CA(a5)
	pea.l	Str_CloneA1FactoryFloor1(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnCloneA1(a5)
	pea.l	$EC2(a5)
	pea.l	Str_CerebroScreenPlayerSelect_0058A2(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnPlayerSelect(a5)
	pea.l	$118A(a5)
	pea.l	Str_CloneA2VerticalCorridor1(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnCloneA2(a5)
	pea.l	$EC2(a5)
	pea.l	Str_CerebroScreenPlayerSelect_00586A(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnPlayerSelect(a5)
	pea.l	$1442(a5)
	pea.l	Str_CloneA5BroodBoss(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnCloneA5(a5)
	pea.l	$ED2(a5)
	pea.l	Str_CerebroScreenFinalText(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnFinalText(a5)
	pea.l	$EDA(a5)
	pea.l	Str_CerebroScreenCredits(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnCredits(a5)
	pea.l	$EE2(a5)
	pea.l	Str_CerebroScreenFailure(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnFailure(a5)
	pea.l	$EC2(a5)
	pea.l	Str_CerebroScreenPlayerSelect_0057F8(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnPlayerSelect(a5)
	pea.l	$ECA(a5)
	pea.l	Str_CerebroScreenLogoAndDemo(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,g_ScnLogoAndDemo(a5)
	unlk	a6
	rts
