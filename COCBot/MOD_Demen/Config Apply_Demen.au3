; #FUNCTION# ====================================================================================================================
; Name ..........: applyConfig.au3
; Description ...: Applies all of the  variable to the GUI
; Syntax ........: applyConfig()
; Parameters ....: $bRedrawAtExit = True, redraws bot window after config was applied
; Return values .: NA
; Author ........: Demen
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2017
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func ApplyConfig_SimpleTrain($TypeReadSave)
	Switch $TypeReadSave
		Case "Read"
			; 	QuickTrainCombo (Checkbox)
			GUICtrlSetState($g_hChkUseQuickTrain, $g_bQuickTrainEnable ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetState($g_ahChkArmy[0], $g_bQuickTrainArmy[0] ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetState($g_ahChkArmy[1], $g_bQuickTrainArmy[1] ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetState($g_ahChkArmy[2], $g_bQuickTrainArmy[2] ? $GUI_CHECKED : $GUI_UNCHECKED)

			; SimpleTrain (Demen)
			GUICtrlSetState($g_hchkSimpleTrain, $ichkSimpleTrain = 1 ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetState($g_hchkPreciseTroops, $ichkPreciseTroops = 1 ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetState($g_hchkFillArcher, $ichkFillArcher = 1 ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetData($g_htxtFillArcher, $iFillArcher)
			GUICtrlSetState($g_hchkFillEQ, $ichkFillEQ = 1 ? $GUI_CHECKED : $GUI_UNCHECKED)
			chkSimpleTrain()

		Case "Save"
			; 	QuickTrainCombo (Checkbox)
			$g_bQuickTrainEnable = (GUICtrlRead($g_hChkUseQuickTrain) = $GUI_CHECKED)
			$g_bQuickTrainArmy[0] = (GUICtrlRead($g_ahChkArmy[0]) = $GUI_CHECKED)
			$g_bQuickTrainArmy[1] = (GUICtrlRead($g_ahChkArmy[1]) = $GUI_CHECKED)
			$g_bQuickTrainArmy[2] = (GUICtrlRead($g_ahChkArmy[2]) = $GUI_CHECKED)

			;SimpleTrain (Demen) - Added by Demen
			$ichkSimpleTrain = GUICtrlRead($g_hchkSimpleTrain) = $GUI_CHECKED ? 1 : 0
			$ichkPreciseTroops = GUICtrlRead($g_hchkPreciseTroops) = $GUI_CHECKED ? 1 : 0
			$ichkFillArcher = GUICtrlRead($g_hchkFillArcher) = $GUI_CHECKED ? 1 : 0
			$iFillArcher = GUICtrlRead($g_htxtFillArcher)
			$ichkFillEQ = GUICtrlRead($g_hchkFillEQ) = $GUI_CHECKED ? 1 : 0
	EndSwitch
EndFunc   ;==>ApplyConfig_SimpleTrain

Func ApplyConfig_SwitchAcc($TypeReadSave)
	; <><><> SwitchAcc_Demen_Style <><><>
	Switch $TypeReadSave
		Case "Read"
			GUICtrlSetState($chkSwitchAcc, $ichkSwitchAcc = 1 ? $GUI_CHECKED : $GUI_UNCHECKED)
			chkSwitchAcc()
			If $ichkSmartSwitch = 1 Then
				GUICtrlSetState($radSmartSwitch, $GUI_CHECKED)
			Else
				GUICtrlSetState($radNormalSwitch, $GUI_CHECKED)
			EndIf
			If GUICtrlRead($chkSwitchAcc) = $GUI_CHECKED Then radNormalSwitch()
			_GUICtrlComboBox_SetCurSel($cmbTotalAccount, $icmbTotalCoCAcc - 1)
			GUICtrlSetState($g_hChkForceSwitch, $ichkForceSwitch = 1 ? $GUI_CHECKED : $GUI_UNCHECKED)
			GUICtrlSetData($g_txtForceSwitch, $iForceSwitch)
			If GUICtrlRead($chkSwitchAcc) = $GUI_CHECKED Then chkForceSwitch()
			GUICtrlSetState($g_hChkForceStayDonate, $ichkForceStayDonate = 1 ? $GUI_CHECKED : $GUI_UNCHECKED)
			If $ichkCloseTraining >= 1 Then
				GUICtrlSetState($chkUseTrainingClose, $GUI_CHECKED)
				If $ichkCloseTraining = 1 Then
					GUICtrlSetState($radCloseCoC, $GUI_CHECKED)
				Else
					GUICtrlSetState($radCloseAndroid, $GUI_CHECKED)
				EndIf
			Else
				GUICtrlSetState($chkUseTrainingClose, $GUI_UNCHECKED)
			EndIf
			For $i = 0 To 7
				_GUICtrlComboBox_SetCurSel($cmbAccountNo[$i], $aMatchProfileAcc[$i] - 1)
				_GUICtrlComboBox_SetCurSel($cmbProfileType[$i], $aProfileType[$i] - 1)
			Next

		Case "Save"
			$ichkSwitchAcc = GUICtrlRead($chkSwitchAcc) = $GUI_CHECKED ? 1 : 0
			$icmbTotalCoCAcc = _GUICtrlComboBox_GetCurSel($cmbTotalAccount) + 1
			$ichkSmartSwitch = GUICtrlRead($radSmartSwitch) = $GUI_CHECKED ? 1 : 0
			$ichkForceSwitch = GUICtrlRead($g_hChkForceSwitch) = $GUI_CHECKED ? 1 : 0
			$ichkForceStayDonate = GUICtrlRead($g_hChkForceStayDonate) = $GUI_CHECKED ? 1 : 0
			$iForceSwitch = GUICtrlRead($g_txtForceSwitch)
			$ichkCloseTraining = GUICtrlRead($chkUseTrainingClose) = $GUI_CHECKED ? 1 : 0
			If $ichkCloseTraining = 1 Then
				$ichkCloseTraining = GUICtrlRead($radCloseCoC) = $GUI_CHECKED ? 1 : 2
			EndIf
	EndSwitch
EndFunc   ;==>ApplyConfig_SwitchAcc
