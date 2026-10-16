; ---------------------------------------------------------------------------
; SwampFly_StatePickPath_Case5 - SwampFly_StatePickPath case 5: path Tbl_SwampFlyPath5 (jt $22B2)
; Evidence: switch target
; Found: static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)
; ---------------------------------------------------------------------------
SwampFly_StatePickPath_Case5:
	lea.l	$22B2(a5),a0
	move.l	$2(a0),$A4(a4)
