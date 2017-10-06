######################################
#	CS014AL Project: Image Editor	
#	Window Prototype			        
#	Yue,Lu				                
#	10/04/2017		                
######################################

###10/04：根据原型布局，简单的框架搭建###
###10/06：Add a subpanel at the bottom of mainpanel (for crtl+z) and a panel at the top of all panels for maximize,minimize and exit###

#name of window Image Editor
wm title . "Image Editor"

###background color
###76EEC6 
###528B8B

#XO-
frame .top -background gray -height 50 -width 1700
pack .top -side top -fill both -expand true
### Maximize Minimize Exit###
button .top.b1 -text "Button1" 
pack .top.b1  -side right  -padx 10
button .top.b2 -text "Button2" 
pack .top.b2  -side right  -padx 10
###label must be at the end of mainpanel code###
label .top.label  -background gray  -text "" -width 226
pack .mainpanel.label -side top


#Menu Bar
frame .subpanel1 -background #528B8B  -height 800 
###这里不设置-expand###
pack .subpanel1 -side left -fill both 
label .subpanel1.label  -background #528B8B  -text "" -width 5
pack .subpanel1.label -side bottom
###最旁边的工具栏，按钮设置top会从上往下排###
button .subpanel1.b1 -text "Button1" 
pack .subpanel1.b1  -side top  -pady 10
button .subpanel1.b2 -text "Button2" 
pack .subpanel1.b2  -side top  -pady 10

#Tool Bar 2
frame .subpanel2 -background #76EEC6 -height 800 -width 300
pack .subpanel2 -side left -fill both -expand true
###在每个frame的最底下加入label把frame从左到右撑起来###
###width 40是最小化时工具栏的长度（后期需要调整）###
label .subpanel2.label  -background #76EEC6  -text "" -width 40
pack .subpanel2.label -side bottom


#Operation Field
###作业区###
frame .mainpanel -background white -height 800 -width 1000
pack .mainpanel -side left -fill both -expand true

frame .mainpanel.bottom -background #528B8B  -width 1000
pack .mainpanel.bottom -side bottom -fill both
button .mainpanel.bottom.b1 -text "Button1" 
pack .mainpanel.bottom.b1  -side right  -padx 10
button .mainpanel.bottom.b2 -text "Button2" 
pack .mainpanel.bottom.b2  -side right  -padx 10

###label must be at the end of mainpanel code###
label .mainpanel.label  -background white  -text "" -width 133
pack .mainpanel.label -side bottom


#Tool Bar 3
frame .subpanel3 -background #76EEC6 -height 800 -width 300
pack .subpanel3 -side left -fill both -expand true
label .subpanel3.label  -background #76EEC6  -text "" -width 40
pack .subpanel3.label -side bottom
