#################################
#	CS014AL Project: Image Editor	#
#	Window Prototype			        #
#	Yue,Lu				                #
#	10/04/2017		                #
#################################

###10/04：根据原型布局，简单的框架搭建###

#name of window Image Editor
wm title . "Image Editor"

#Tool Bar 1
frame .subpanel1 -background gray  -height 800 
###这里不设置-expand###
pack .subpanel1 -side left -fill both 
label .subpanel1.label  -background gray  -text "" -width 5
pack .subpanel1.label -side bottom
###最旁边的工具栏，按钮设置top会从上往下排###
#button .subpanel1.b1 -text "Button1"
#pack .subpanel1.b1  -side top 
#button .subpanel1.b2 -text "Button2"
#pack .subpanel1.b2  -side top

#Tool Bar 2
frame .subpanel2 -background gray -height 800 -width 300
pack .subpanel2 -side left -fill both -expand true
###在每个frame的最底下加入label把frame从左到右撑起来###
###width 40是最小化时工具栏的长度（后期需要调整）###
label .subpanel2.label  -background gray  -text "" -width 40
pack .subpanel2.label -side bottom


#Operation Field
###作业区###
frame .mainpanel -background white -height 800 -width 1000
pack .mainpanel -side left -fill both -expand true


#Tool Bar 3
frame .subpanel3 -background gray -height 800 -width 300
pack .subpanel3 -side left -fill both -expand true
label .subpanel3.label  -background gray  -text "" -width 40
pack .subpanel3.label -side bottom
