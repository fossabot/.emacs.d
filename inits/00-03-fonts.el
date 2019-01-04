;;; 00-03-fonts.el --- 設定 - フォント

;; Copyright (C) 2013-2018 Taku Watabe
;; Time-stamp: <2018-11-12T16:51:36+09:00>

;;; Commentary:

;; WARNING: 文字セット・コーディングシステム設定よりも後で設定すること。

;; 文字幅調整テスト:
;;   aa
;;   あ
;;   😊

;; 文字拡大・縮小モード
;;   C-x C-0
;;
;; カーソルがポイントしている文字の「簡易」情報を表示:
;;   C-x =
;;
;; カーソルがポイントしている文字の「詳細」情報を表示:
;;   C-u C-x =
;;
;; 各種フォントセットの詳細を、別バッファに表示:
;;   M-x describe-fontset
;;
;; 定義されているフォントセットの一覧を、別バッファに表示:
;;   M-x list-fontsets
;;
;; 利用可能なフォントの一覧:
;;   (dolist (xlfd (x-list-fonts "*")) (insert (format "%S" xlfd) "\n"))
;;
;; 該当ファミリフォントの一覧:
;;   (list-fonts (font-spec :family "ファミリ名"))
;;
;; 定義されているフォントセットの一覧:
;;   (fontset-list)
;;
;; 定義されているフォントセットと、別名（短縮名、エイリアス）の alist:
;;   fontset-alias-alist
;;
;; フレームが使用中のフォントを表示:
;;   (frame-parameter nil 'font)

;; Microsoft Code page 858 (`cp858')
;;
;; 概要:
;;   * ラテン文字
;;   * 基底である ISO/IEC 8859-1 にはない文字を補完するときに利用する
;;   * `cp858' は `cp850' の ı (U+0131) を € (U+20AC) に置換したもの
;;
;; 追加文字:
;;   ÇüéâäàåçêëèïîìÄÅÉæÆôöòûùÿÖÜø£Ø×ƒáíóúñÑªº¿®¬½¼¡«»░▒▓│┤ÁÂÀ©╣║╗╝¢¥┐└┴┬├─┼ãÃ╚╔╩╦╠═╬¤ðÐÊËÈ€ÍÎÏ┘┌█▄¦Ì▀ÓßÔÒõÕµþÞÚÛÙýÝ¯´±‗¾¶§÷¸°¨·¹³²■
;;
;; 英字フォント（半角）で表示されてほしいもの:
;;   ÇüéâäàåçêëèïîìÄÅÉæÆôöòûùÿÖÜø£ØƒáíóúñÑªº¿®¬½¼¡«»░▒▓ÁÂÀ©╣║╗╝¢¥ãÃ╚╔╩╦╠═╬¤ðÐÊËÈ€ÍÎÏ█▄¦Ì▀ÓßÔÒõÕµþÞÚÛÙýÝ¯‗¾¸·¹³²
;;
;; フォントによっては、他の文字と判別しにくいもの:
;;   Ø (U+00d8: LATIN CAPITAL LETTER O WITH STROKE)
;;
;; 日本語フォント（全角）で表示されてほしいもの:
;;   ×│┤┐└┴┬├─┼┘┌´±¶§÷°¨■
;;
;; see also:
;;   http://en.wikipedia.org/wiki/Code_page_858
;;   http://en.wikipedia.org/wiki/Code_page_850

;; Microsoft Code page 932 (cp932)
;;
;; 概要:
;;   * 日本語
;;   * 俗称「Microsoft Shift_JIS」
;;   * cp932 にはあるが、JIS X 0213:2004 にはない文字群がある
;;     例：「カナダ漢字」
;;
;; 特殊文字（マップ順でソート済）:
;;   纊褜鍈銈蓜俉炻昱棈鋹曻彅丨仡仼伀伃伹佖侒侊侚侔俍偀倢俿倞偆偰偂傔僴僘兊兤冝
;;   冾凬刕劜劦勀勛匀匇匤卲厓厲叝﨎咜咊咩哿喆坙坥垬埈埇﨏塚增墲夋奓奛奝奣妤妺孖
;;   寀甯寘寬尞岦岺峵崧嵓﨑嵂嵭嶸嶹巐弡弴彧德忞恝悅悊惞惕愠惲愑愷愰憘戓抦揵摠撝
;;   擎敎昀昕昻昉昮昞昤晥晗晙晴晳暙暠暲暿曺朎朗杦枻桒柀栁桄棏﨓楨﨔榘槢樰橫橆橳
;;   橾櫢櫤毖氿汜沆汯泚洄涇浯涖涬淏淸淲淼渹湜渧渼溿澈澵濵瀅瀇瀨炅炫焏焄煜煆煇凞
;;   燁燾犱犾猤猪獷玽珉珖珣珒琇珵琦琪琩琮瑢璉璟甁畯皂皜皞皛皦益睆劯砡硎硤硺礰礼
;;   神祥禔福禛竑竧靖竫箞精絈絜綷綠緖繒罇羡羽茁荢荿菇菶葈蒴蕓蕙蕫﨟薰蘒﨡蠇裵訒
;;   訷詹誧誾諟諸諶譓譿賰賴贒赶﨣軏﨤逸遧郞都鄕鄧釚釗釞釭釮釤釥鈆鈐鈊鈺鉀鈼鉎鉙
;;   鉑鈹鉧銧鉷鉸鋧鋗鋙鋐﨧鋕鋠鋓錥錡鋻﨨錞鋿錝錂鍰鍗鎤鏆鏞鏸鐱鑅鑈閒隆﨩隝隯霳
;;   霻靃靍靏靑靕顗顥飯飼餧館馞驎髙髜魵魲鮏鮱鮻鰀鵰鵫鶴鸙黑ⅰⅱⅲⅳⅴⅵⅶⅷⅸⅹ
;;   ￢￤＇＂
;;
;; see also:
;;   http://ja.wikipedia.org/wiki/Cp932
;;   http://internet.watch.impress.co.jp/www/column/ogata/news4.htm
;;   http://charset.7jp.net/sjis.html

;; JIS X 0213:2004
;;
;; 字形変更:
;;   逢芦飴溢茨鰯淫迂厩噂餌襖迦牙廻恢晦蟹葛鞄釜翰翫徽
;;   祇汲灸笈卿饗僅喰櫛屑粂祁隙倦捲牽鍵諺巷梗膏鵠甑叉
;;   榊薩鯖錆鮫餐杓灼酋楯薯藷哨鞘杖蝕訊逗摺撰煎煽穿箭
;;   詮噌遡揃遜腿蛸辿樽歎註瀦捗槌鎚辻挺鄭擢溺兎堵屠賭
;;   瀞遁謎灘楢禰牌這秤駁箸叛挽誹樋稗逼謬豹廟瀕斧蔽瞥
;;   蔑篇娩鞭庖蓬鱒迄儲餅籾爺鑓愈猷漣煉簾榔屢冤叟咬嘲
;;   囀徘扁棘橙狡甕甦疼祟竈筵篝腱艘芒虔蜃蠅訝靄靱騙鴉
;;
;; 平仮名・片仮名・記号など:
;;   ゔヿヷヸヹヺㇰㇱㇲㇳㇴㇵㇶㇷㇸㇹㇺㇻㇼㇽ
;;
;; 第3水準（追加・1面）:
;;   旧：倶剥叱呑嘘妍屏并痩繋
;;   新：俱剝𠮟吞噓姸屛幷瘦繫
;;
;; 第4水準（一部・2面）:
;;   𠂉𪚲

;; see also:
;;   `00-utils.el': 各種サポート関数・マクロ定義あり
;;   `mule-conf.el': 文字セット定義
;;   `mule-diag.el': 文字セット・コーディングシステム汎用ツール群
;;   `japanese.el': 日本語コーディングシステム定義
;;   https://www.gnu.org/software/emacs/manual/html_node/elisp/Font-Lookup.html
;;   https://www.gnu.org/software/emacs/manual/html_node/elisp/Font-Selection.html
;;   https://www.gnu.org/software/emacs/manual/html_node/elisp/Fontsets.html
;;   https://www.gnu.org/software/emacs/manual/html_node/elisp/Low_002dLevel-Font.html
;;   https://www.gnu.org/software/emacs/manual/html_node/efaq/Alternate-character-sets.html
;;   https://www.gnu.org/software/emacs/manual/html_node/efaq-w32/Fonts-and-text-translation.html
;;   http://www.emacswiki.org/emacs/DisplayingNonAsciiCharacters
;;   http://www.emacswiki.org/emacs/FontSets
;;   http://d.hatena.ne.jp/setoryohei/20110117
;;   http://d.hatena.ne.jp/tomoya/20090519/1242687354
;;   http://d.hatena.ne.jp/tomoya/20090807/1249641049
;;   http://emacs.g.hatena.ne.jp/sakito/20100127
;;   http://macemacsjp.sourceforge.jp/matsuan/FontSettingJp.html
;;   http://www.shuiren.org/chuden/teach/code/main5.htm
;;   http://lioon.net/emacs-change-font-size-quickly

;;; Code:

;; ----------------------------------------------------------------------------
;; スケール変換
;;
;; 多バイト文字の認識に支障がある場合の書法:
;;   `(,(encode-coding-string "-フォント名-" 'emacs-mule) . 倍率)
;; ----------------------------------------------------------------------------
(eval-after-load 'my-utils
  '(progn
     (add-to-list 'face-font-rescale-alist '("-YuGothic-" . 1.24))
     (add-to-list 'face-font-rescale-alist '("-Apple Color Emoji-" . 0.917))
     (add-to-list 'face-font-rescale-alist '("-Courier New-" . 0.91))
     (add-to-list 'face-font-rescale-alist '("-Consolas-" . 0.98))))


;; ----------------------------------------------------------------------------
;; シンボルや句読点などを表示するフォントを、フォント設定に応じて選択させる
;;   → GNU Emacs 25 より前のふるまいに戻す
;; ----------------------------------------------------------------------------
(custom-set-variables
 '(use-default-font-for-symbols nil))


;; ----------------------------------------------------------------------------
;; フォントセット: プログラミング用
;; ----------------------------------------------------------------------------
(eval-after-load 'my-utils
  '(progn
     (my-create-fontset-from-spec "programming"
                                  (font-spec :size 12.0 ; デフォルトフォントサイズ (pt)
                                             :family (my-fallback-font-family "Consolas"
                                                                              "Inconsolata"
                                                                              "Menlo"
                                                                              "Monaco"
                                                                              "Courier New"
                                                                              "Monospace")))
     ;; 最終フォールバック
     (my-set-fontset-font-safe "fontset-programming"
                               nil
                               (font-spec :family (my-fallback-font-family "Consolas"
                                                                           "Inconsolata"
                                                                           "Menlo"
                                                                           "Monaco"
                                                                           "Courier New"
                                                                           "Monospace")))
     ;; Emoji
     (my-set-fontset-font-safe "fontset-programming"
                               nil
                               (font-spec :family (my-fallback-font-family "Segoe UI Emoji"
                                                                           "Segoe UI Symbol"
                                                                           "Apple Color Emoji"
                                                                           "AndroidEmoji"
                                                                           "Symbola")))
     ;; 中国語（簡体字）: Code page 936 (cp936) 相当
     (my-set-fontset-font-safe "fontset-programming"
                               'chinese-gbk
                               (font-spec :family (my-fallback-font-family "PingFang SC"
                                                                           "Microsoft YaHei"
                                                                           "SimHei")))
     ;; 中国語（繁体字）: Code page 937 (cp937) 相当
     (my-set-fontset-font-safe "fontset-programming"
                               'big5
                               (font-spec :family (my-fallback-font-family "PingFang TC"
                                                                           "BiauKai"
                                                                           "Microsoft JhengHei"
                                                                           "MingLiU")))
     ;; 日本語: JIS X 0213:2004
     ;;
     ;; japanese-jisx0213-2 を明示しているのは、
     ;; japanese-jisx0213.2004-1 が2面を含まないため
     (my-set-fontset-font-safe "fontset-programming"
                               'japanese-jisx0213-2 ; 2面
                               (font-spec :family (my-fallback-font-family "Migu 1M"
                                                                           "VL Gothic"
                                                                           "游ゴシック Medium"
                                                                           "YuGothic Medium"
                                                                           "メイリオ")))
     (my-set-fontset-font-safe "fontset-programming"
                               'japanese-jisx0213.2004-1 ; 1面＋第3水準追加文字
                               (font-spec :family (my-fallback-font-family "Migu 1M"
                                                                           "VL Gothic"
                                                                           "游ゴシック Medium"
                                                                           "YuGothic Medium"
                                                                           "メイリオ")))
     ;; 日本語: Code page 932 (cp932)
     (my-set-fontset-font-safe "fontset-programming"
                               'cp932
                               (font-spec :family (my-fallback-font-family "Migu 1M"
                                                                           "VL Gothic"
                                                                           "游ゴシック Medium"
                                                                           "YuGothic Medium"
                                                                           "メイリオ")))
     ;; ラテン文字: Code page 858 (`cp858')
     (my-set-fontset-font-safe "fontset-programming"
                               'cp858
                               (font-spec :family (my-fallback-font-family "Consolas"
                                                                           "Inconsolata"
                                                                           "Monaco"
                                                                           "Courier New"
                                                                           "Monospace")))
     (my-set-fontset-font-safe "fontset-programming"
                               (cons (string-to-char "░") (string-to-char "▓"))
                               (font-spec ;; PATCH: 次のフォントは U+2591, U+2592, U+2593 未実装:
                                          ;;          * "Consolas"
                                          ;;          * "Inconsolata"
                                          ;;        ゆえに、他フォントによるフォールバックが必要
                                :family (my-fallback-font-family "Menlo"
                                                                 "Monaco"
                                                                 "Courier New"
                                                                 "Monospace")))
     ;; Unicode "Box Drawing"（罫線素片）
     ;;
     ;; see also:
     ;; http://www.unicode.org/charts/PDF/U2500.pdf
     (my-set-fontset-font-safe "fontset-programming"
                               (cons (string-to-char "─") (string-to-char "╿"))
                               ;; TODO: MacOS で YuGothic Medium だと、
                               ;;       半角で表示されてしまう文字がある
                               (font-spec :family (my-fallback-font-family "YuGothic Medium"
                                                                           "ＭＳ ゴシック"
                                                                           "さざなみフォント"
                                                                           "東雲フォント")))
     ;; "§" (U+00A7: SECTION SIGN)
     ;; "¨" (U+00A8: DIAERESIS)
     ;; "°" (U+00B0: DEGREE SIGN)
     ;; "±" (U+00B1: PLUS-MINUS SIGN)
     ;; "´" (U+00B4: ACUTE ACCENT)
     ;; "¶" (U+00B6: PILCROW SIGN)
     ;; "×" (U+00D7: LATIN CAPITAL LETTER O WITH STROKE)
     ;; "÷" (U+00F7: DIVISION SIGN)
     ;; "─" (U+2500: BOX DRAWINGS LIGHT HORIZONTAL)
     ;; "│" (U+2502: BOX DRAWINGS LIGHT VERTICAL)
     ;; "┌" (U+250c: BOX DRAWINGS LIGHT DOWN AND RIGHT)
     ;; "┐" (U+2510: BOX DRAWINGS LIGHT DOWN AND LEFT)
     ;; "└" (U+2514: BOX DRAWINGS LIGHT UP AND RIGHT)
     ;; "┘" (U+2518: BOX DRAWINGS LIGHT UP AND LEFT)
     ;; "├" (U+251c: BOX DRAWINGS LIGHT VERTICAL AND RIGHT)
     ;; "┤" (U+2524: BOX DRAWINGS LIGHT VERTICAL AND LEFT)
     ;; "┬" (U+252c: BOX DRAWINGS LIGHT DOWN AND HORIZONTAL)
     ;; "┴" (U+2534: BOX DRAWINGS LIGHT UP AND HORIZONTAL)
     ;; "┼" (U+253c: BOX DRAWINGS LIGHT VERTICAL AND HORIZONTAL)
     ;; "■" (U+25A0: BLACK SQUARE)
     ;;
     ;; `cp858' に含まれているため、半角フォントが利用されてしまう問題を回避
     (dolist (code (mapcar 'string-to-char
                           (split-string "§¨°±´¶×÷─│┌┐└┘├┤┬┴┼■" "" t)))
       (my-set-fontset-font-safe "fontset-programming"
                                 (cons code code)
                                 (font-spec :family (my-fallback-font-family "Migu 1M"
                                                                             "YuGothic Medium"
                                                                             "VL Gothic"
                                                                             "メイリオ"))))
     ;; ASCII
     (my-set-fontset-font-safe "fontset-programming"
                               'ascii
                               (font-spec :size 12.0 ; デフォルトフォントサイズ (pt)
                                          :family (my-fallback-font-family "Consolas"
                                                                           "Inconsolata"
                                                                           "Menlo"
                                                                           "Monaco"
                                                                           "Courier New"
                                                                           "Monospace")))))


;; ----------------------------------------------------------------------------
;; フォントセット: プログラミング用
;;                 ビットマップフォント主体・96dpi 環境向け
;; ----------------------------------------------------------------------------
;; see also:
;;   http://tobiasjung.name/profont/
;;   http://osaka.is.land.to/
;;   http://emk.name/2003/12/osakattf.html
;; ----------------------------------------------------------------------------
(eval-after-load 'my-utils
  '(progn
     (my-create-fontset-from-spec "programmingBMP"
                                  (font-spec :size 12 ; デフォルトフォントサイズ (px)
                                             :family (my-fallback-font-family "ProFontWindows"
                                                                              "Consolas"
                                                                              "Inconsolata"
                                                                              "Courier New"
                                                                              "Monospace")))
     ;; 最終フォールバック
     (my-set-fontset-font-safe "fontset-programmingBMP"
                               nil
                               (font-spec :family (my-fallback-font-family "Consolas"
                                                                           "Inconsolata"
                                                                           "Courier New"
                                                                           "Monospace")))
     ;; Emoji
     (my-set-fontset-font-safe "fontset-programmingBMP"
                               nil
                               (font-spec :family (my-fallback-font-family "Segoe UI Emoji"
                                                                           "Segoe UI Symbol"
                                                                           "AndroidEmoji"
                                                                           "Symbola")))
     ;; 中国語（簡体字）: Code page 936 (cp936) 相当
     (my-set-fontset-font-safe "fontset-programmingBMP"
                               'chinese-gbk
                               (font-spec :family (my-fallback-font-family "SimHei")))
     ;; 中国語（繁体字）: Code page 12.0 (cp937) 相当
     (my-set-fontset-font-safe "fontset-programmingBMP"
                               'big5
                               (font-spec :family (my-fallback-font-family "MingLiU")))
     ;; 日本語: JIS X 0213:2004
     ;;
     ;; japanese-jisx0213-2 を明示しているのは、
     ;; japanese-jisx0213.2004-1 が2面を含まないため
     (my-set-fontset-font-safe "fontset-programmingBMP"
                               'japanese-jisx0213.2004-1 ; 1面＋第3水準追加文字
                               (font-spec :family (my-fallback-font-family "ＭＳ ゴシック"
                                                                           "さざなみフォント"
                                                                           "東雲フォント")))
     (my-set-fontset-font-safe "fontset-programmingBMP"
                               'japanese-jisx0213-2 ; 2面
                               (font-spec :family (my-fallback-font-family "ＭＳ ゴシック"
                                                                           "さざなみフォント"
                                                                           "東雲フォント")))
     ;; 日本語: cp932
     (my-set-fontset-font-safe "fontset-programmingBMP"
                               'cp932
                               (font-spec :family (my-fallback-font-family "ＭＳ ゴシック"
                                                                           "さざなみフォント"
                                                                           "東雲フォント")))
     ;; 日本語: JIS X 0208
     ;;
     ;; "Osaka－等幅" で対応している文字はできるだけ利用
     (my-set-fontset-font-safe "fontset-programmingBMP"
                               'japanese-jisx0208
                               (font-spec :family (my-fallback-font-family "Osaka－等幅"
                                                                           "ＭＳ ゴシック"
                                                                           "さざなみフォント"
                                                                           "東雲フォント")))
     ;; ラテン文字: `cp858'
     ;;
     ;; "ProFontWindows" の readme.txt には次の記述がある:
     ;;
     ;;   * € サポートを投入
     ;;   * cp585 フルサポート
     ;;
     ;; ゆえに、明示はないものの "ProFontWindows" の範囲は
     ;; `cp858' と同一であると仮定・設定する
     (my-set-fontset-font-safe "fontset-programmingBMP"
                               'cp858
                               (font-spec :family (my-fallback-font-family "ProFontWindows"
                                                                           "Consolas"
                                                                           "Inconsolata"
                                                                           "Courier New"
                                                                           "Monospace")))
     ;; Unicode "Box Drawing"（罫線素片）
     ;;
     ;; see also:
     ;; http://www.unicode.org/charts/PDF/U2500.pdf
     (my-set-fontset-font-safe "fontset-programmingBMP"
                               (cons (string-to-char "─") (string-to-char "╿"))
                               (font-spec :family (my-fallback-font-family "ＭＳ ゴシック"
                                                                           "さざなみフォント"
                                                                           "東雲フォント")))
     ;; "§" (U+00A7: SECTION SIGN)
     ;; "¨" (U+00A8: DIAERESIS)
     ;; "°" (U+00B0: DEGREE SIGN)
     ;; "±" (U+00B1: PLUS-MINUS SIGN)
     ;; "´" (U+00B4: ACUTE ACCENT)
     ;; "¶" (U+00B6: PILCROW SIGN)
     ;; "×" (U+00D7: LATIN CAPITAL LETTER O WITH STROKE)
     ;; "÷" (U+00F7: DIVISION SIGN)
     ;; "─" (U+2500: BOX DRAWINGS LIGHT HORIZONTAL)
     ;; "│" (U+2502: BOX DRAWINGS LIGHT VERTICAL)
     ;; "┌" (U+250c: BOX DRAWINGS LIGHT DOWN AND RIGHT)
     ;; "┐" (U+2510: BOX DRAWINGS LIGHT DOWN AND LEFT)
     ;; "└" (U+2514: BOX DRAWINGS LIGHT UP AND RIGHT)
     ;; "┘" (U+2518: BOX DRAWINGS LIGHT UP AND LEFT)
     ;; "├" (U+251c: BOX DRAWINGS LIGHT VERTICAL AND RIGHT)
     ;; "┤" (U+2524: BOX DRAWINGS LIGHT VERTICAL AND LEFT)
     ;; "┬" (U+252c: BOX DRAWINGS LIGHT DOWN AND HORIZONTAL)
     ;; "┴" (U+2534: BOX DRAWINGS LIGHT UP AND HORIZONTAL)
     ;; "┼" (U+253c: BOX DRAWINGS LIGHT VERTICAL AND HORIZONTAL)
     ;; "■" (U+25A0: BLACK SQUARE)
     ;;
     ;; `cp858' に含まれているため、半角フォントが利用されてしまう問題を回避
     (dolist (code (mapcar 'string-to-char
                           (split-string "§¨°±´¶×÷─│┌┐└┘├┤┬┴┼■" "" t)))
       (my-set-fontset-font-safe "fontset-programmingBMP"
                                 (cons code code)
                                 (font-spec :family (my-fallback-font-family "Osaka－等幅"
                                                                             "ＭＳ ゴシック"
                                                                             "さざなみフォント"
                                                                             "東雲フォント"))))
     ;; "Ø" (U+00D8: LATIN CAPITAL LETTER O WITH STROKE)
     ;;
     ;; フォントによっては "0" (U+0030: DIGIT ZERO) と判別しにくいため、
     ;; 他のフォントに変更（判別しにくいフォントの例："ProFontWindows"）
     (my-set-fontset-font-safe "fontset-programmingBMP"
                               (cons (string-to-char "Ø") (string-to-char "Ø"))
                               (font-spec :family (my-fallback-font-family "ＭＳ ゴシック"
                                                                           "さざなみフォント"
                                                                           "東雲フォント"
                                                                           "Consolas"
                                                                           "Inconsolata"
                                                                           "Courier New")))
     ;; ASCII
     (my-set-fontset-font-safe "fontset-programmingBMP"
                               'ascii
                               (font-spec :size 12 ; デフォルトフォントサイズ (px)
                                          :family (my-fallback-font-family "ProFontWindows"
                                                                           "Consolas"
                                                                           "Inconsolata"
                                                                           "Courier New"
                                                                           "Monospace")))))


;; ----------------------------------------------------------------------------
;; フォントセット設定
;; ----------------------------------------------------------------------------
(eval-after-load 'my-utils
  '(progn
     (let ((fontset (if (< (car (my-real-display-pixels-per-inch)) 97)
                        "fontset-programmingBMP"
                      "fontset-programming")))
       (modify-all-frames-parameters `((font . ,fontset)))

       ;; TODO: ダイアログの face も変えたい
       ;;       シンボル名不明
       ;;       (face-list) で一覧出しても、それらしきものがなかった
       (custom-set-faces
        `(tooltip ((t
                    (:font ,fontset))))))))


;; ----------------------------------------------------------------------------
;; Local Variables:
;; coding: utf-8-unix
;; mode: Emacs-Lisp
;; no-byte-compile: t
;; End:

;;; 00-03-fonts.el ends here
