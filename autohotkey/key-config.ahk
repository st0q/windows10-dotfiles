#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory
; #Warn  ; Enable warnings to assist with detecting common errors.

; Ctrl + Alt + R でスクリプトを再読み込み.
; Ctrl + Alt + E でスクリプトを編集.
^!R::Reload
^!E::Edit


;;; 左Ctrlキーが単独で押された場合、IMEをオフにする
~LControl Up::
if (A_PriorKey = "LControl") {
    Send, {vkF2sc070}{vkF3sc029}
}
Return

;;; 右Ctrlキーが単独で押された場合、IMEをオンにする
~RControl Up::
if (A_PriorKey = "RControl") {
    Send, {vkF2sc070}
}
Return

;;; コロンとセミコロンの入れ替え
*vkBA::
    If (GetKeyState("Shift")){
        Send `;
    }
    else {
        Send :
    }
    return

;;; Ctrl+左でHOME
Ctrl & Left::
  if GetKeyState("Shift") {
    Send +{Home}
    return
  }
  Send, {Home}
return

;;; Ctrl+右でEnd
Ctrl & Right::
  if GetKeyState("Shift") {
    Send +{End}
    return
  }
  Send, {End}
return

;;; Ctrl+上でCtrl+Home
  Ctrl & Up::
  Send, {Ctrl down}{Home}{Ctrl up}
return

;;; Ctrl+下でCtrl+End
  Ctrl & Down::
  Send, {Ctrl down}{End}{Ctrl up}
return


;;; 矢印キーの置き換え
F13 & H::Send,{Blind}{Left}
F13 & J::Send,{Blind}{Down}
F13 & K::Send,{Blind}{Up}
F13 & L::Send,{Blind}{Right}
