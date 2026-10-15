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
	move.b	d0,-$3B70(a5)
	pea.l	$E92(a5)
	pea.l	Str_CerebroScreenSentinels(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B7A(a5)
	pea.l	$2412(a5)
	pea.l	Str_SentinelsD1Exterior1(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B72(a5)
	pea.l	$EC2(a5)
	pea.l	Str_CerebroScreenPlayerSelect(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B88(a5)
	pea.l	$2932(a5)
	pea.l	Str_SentinelsB1Exterior3(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B74(a5)
	pea.l	$EC2(a5)
	pea.l	Str_CerebroScreenPlayerSelect_005BE8(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B88(a5)
	pea.l	$262A(a5)
	pea.l	Str_SentinelsA1CoolantCore(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B76(a5)
	pea.l	$294A(a5)
	pea.l	Str_SentinelsB2ExteriorEscape(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B78(a5)
	pea.l	$E9A(a5)
	pea.l	Str_CerebroScreenAvalon(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B7C(a5)
	pea.l	$BA(a5)
	pea.l	Str_AvalonB1Exterior(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B4A(a5)
	pea.l	$EC2(a5)
	pea.l	Str_CerebroScreenPlayerSelect_005B70(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B88(a5)
	pea.l	$4FA(a5)
	pea.l	Str_AvalonB2InnerShell(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B4C(a5)
	pea.l	$EC2(a5)
	pea.l	Str_CerebroScreenPlayerSelect_005B40(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B88(a5)
	pea.l	$502(a5)
	pea.l	Str_AvalonA2FallingRoom(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B4E(a5)
	pea.l	$EC2(a5)
	pea.l	Str_CerebroScreenPlayerSelect_005B0E(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B88(a5)
	pea.l	$60A(a5)
	pea.l	Str_AvalonA3Exodus(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B50(a5)
	pea.l	$EC2(a5)
	pea.l	Str_CerebroScreenPlayerSelect_005AE2(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B88(a5)
	pea.l	$732(a5)
	pea.l	Str_AvalonA4ThroneRoom(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B52(a5)
	pea.l	$EA2(a5)
	pea.l	Str_CerebroScreenBaniMaza(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B7E(a5)
	pea.l	$CAA(a5)
	pea.l	Str_BaniMazaB2Exterior(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B54(a5)
	pea.l	$EC2(a5)
	pea.l	Str_CerebroScreenPlayerSelect_005A84(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B88(a5)
	pea.l	$82A(a5)
	pea.l	Str_BaniMazaA1MovingBlocks(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B56(a5)
	pea.l	$EC2(a5)
	pea.l	Str_CerebroScreenPlayerSelect_005A4E(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B88(a5)
	pea.l	$9B2(a5)
	pea.l	Str_BaniMazaA2ApocalypseBoss(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B58(a5)
	pea.l	$EAA(a5)
	pea.l	Str_CerebroScreenSavage(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B80(a5)
	pea.l	$2312(a5)
	pea.l	Str_SavageC1Jungle1(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B5A(a5)
	pea.l	$EC2(a5)
	pea.l	Str_CerebroScreenPlayerSelect_0059F0(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B88(a5)
	pea.l	$231A(a5)
	pea.l	Str_SavageB1Jungle2(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B5E(a5)
	pea.l	$EC2(a5)
	pea.l	Str_CerebroScreenPlayerSelect_0059C2(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B88(a5)
	pea.l	$1C22(a5)
	pea.l	Str_SavageA2Perimeter1(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B60(a5)
	pea.l	$EC2(a5)
	pea.l	Str_CerebroScreenPlayerSelect_005990(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B88(a5)
	pea.l	$1C72(a5)
	pea.l	Str_SavageA3Perimeter2(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B62(a5)
	pea.l	$EC2(a5)
	pea.l	Str_CerebroScreenPlayerSelect_00595E(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B88(a5)
	pea.l	$1CA2(a5)
	pea.l	Str_SavageA4Chamber(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B64(a5)
	pea.l	$EB2(a5)
	pea.l	Str_CerebroScreenSpace(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B82(a5)
	pea.l	$2A22(a5)
	pea.l	Str_SpaceB1MaintenanceShaft(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B66(a5)
	pea.l	$EC2(a5)
	pea.l	Str_CerebroScreenPlayerSelect_005902(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B88(a5)
	pea.l	$2AAA(a5)
	pea.l	Str_SpaceA1SpaceElevator(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B68(a5)
	pea.l	$EBA(a5)
	pea.l	Str_CerebroScreenClone(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B84(a5)
	pea.l	$10CA(a5)
	pea.l	Str_CloneA1FactoryFloor1(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B6A(a5)
	pea.l	$EC2(a5)
	pea.l	Str_CerebroScreenPlayerSelect_0058A2(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B88(a5)
	pea.l	$118A(a5)
	pea.l	Str_CloneA2VerticalCorridor1(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B6C(a5)
	pea.l	$EC2(a5)
	pea.l	Str_CerebroScreenPlayerSelect_00586A(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B88(a5)
	pea.l	$1442(a5)
	pea.l	Str_CloneA5BroodBoss(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B6E(a5)
	pea.l	$ED2(a5)
	pea.l	Str_CerebroScreenFinalText(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B8E(a5)
	pea.l	$EDA(a5)
	pea.l	Str_CerebroScreenCredits(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B86(a5)
	pea.l	$EE2(a5)
	pea.l	Str_CerebroScreenFailure(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B8C(a5)
	pea.l	$EC2(a5)
	pea.l	Str_CerebroScreenPlayerSelect_0057F8(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B88(a5)
	pea.l	$ECA(a5)
	pea.l	Str_CerebroScreenLogoAndDemo(pc)
	jsr	$4F9A(a5)	; -> Scene_Register
	move.b	d0,-$3B8A(a5)
	unlk	a6
	rts
