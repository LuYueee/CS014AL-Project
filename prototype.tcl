
######################################
#	CS014AL Project: Image Editor	
#	Window Prototype			       
#	Yue,Lu				               
#	10/04/2017		               
######################################

###10/04：根据原型布局，??的框架搭建###
###10/06：Add a subpanel at the bottom of mainpanel (for crtl+z) and a panel at the top of all panels for maximize,minimize and exit###
###10/13 : crate and distory windows && bind enter/leave event###
###10/13(2) : Mouse Event & - Command (crate buttons & destroy buttons); fix size of main/sub window (not complete)###



#name of window Image Editor

wm title . "Image Editor"
#wm maxsize . 1700 900
wm minsize . 1700 900
wm geometry . 1700*900
#wm resizable . 0 0 #cannot maximize and minimize 

###background color
#333333 – mainpanel
#3e3e3e –subpanel
#555555 -menubar





#XO-
frame .top -background #555555 -height 50 -width 1700
pack .top -side top -fill both 
###?里不?置-expand###
### Maximize Minimize Exit###
button .top.b1 -text "Button1" -command "exit" -bg #3e3e3e -image [image create photo -file close.gif]
pack .top.b1  -side right  -padx 10
button .top.b2 -text "Button2" -bg #3e3e3e -image [image create photo -file minimize.gif]
pack .top.b2  -side right  -padx 10
###label must be at the end of mainpanel code###
label .top.label  -background #3E3E3E   -text "" -width 226



#Menu Bar
frame .subpanel1 -background #555555  -height 800 
###?里不?置-expand###
pack .subpanel1 -side left -fill both 
label .subpanel1.label  -background #555555  -text "" -width 5
pack .subpanel1.label -side bottom
###最旁?的工具?，按??置top??上往下排###

###1. destory previous frame in subpanel2###
###2. create new frame in subpanel2###
button .subpanel1.b1 -text "Button1" -command {
destroy .subpanel2.but1;
destroy .subpanel2.but2;
destroy .subpanel2.but3;
destroy .subpanel2.but4;
destroy .subpanel2.but5;
destroy .subpanel2.but6;
###[but] is sub frame of subpanel2###
frame .subpanel2.but1 -background #3E3E3E ;

pack .subpanel2.but1 -side top;
##YiRan,Chen##
button .subpanel2.but1.b1 -text "Button1"    -command {
	package require Tk

set types {
	{{GIF Files}        {.gif}        }
	{{PNG Files}        {.png}        }
	{{JPG Files}        {.jpg}        }
    {{Text Files}       {.txt}        }
    {{TCL Scripts}      {.tcl}        }
    {{C Source Files}   {.c}      TEXT}
    {{Text Files}       {}        TEXT}
    {{All Files}        *             }
}
set filenameList [tk_getOpenFile -filetypes $types -multiple true ]

foreach filename $filenameList {
     if { [file readable $filename] } {
        puts "I found $filename"      
     }
}

set myImage [image create photo]
$myImage read $filename
$t.c create image 550 450 -image $myImage 
}  -bg #3E3E3E ;
##YiRan,Chen##
pack .subpanel2.but1.b1  -side left -padx 20 ;


button .subpanel2.but1.b2 -text "Button2" -bg #3E3E3E;
pack .subpanel2.but1.b2  -side left -padx 20 ;

frame .subpanel2.but4 -background #3E3E3E ;
label .subpanel2.but4.lb1 -text "Single Picture" -fg white -bg #3E3E3E
pack .subpanel2.but4.lb1  -side left  -padx 20 
label .subpanel2.but4.lb2 -text "Multiple Picture" -fg white -bg #3E3E3E
pack .subpanel2.but4.lb2  -side left  -padx 20 
pack .subpanel2.but4 -side top;

frame .subpanel2.but2 -background #3E3E3E ;
pack .subpanel2.but2 -side top;
button .subpanel2.but2.b1 -text "Button3" -bg #3E3E3E;
pack .subpanel2.but2.b1  -side left -padx 20;
button .subpanel2.but2.b2 -text "Button4" -bg #3E3E3E;
pack .subpanel2.but2.b2  -side left -padx 20 ;
frame .subpanel2.but5 -background #3E3E3E ;
label .subpanel2.but5.lb1 -text "Camera" -fg white -bg #3E3E3E
pack .subpanel2.but5.lb1  -side left  -padx 20 
label .subpanel2.but5.lb2 -text "Stitch Pictures" -fg white -bg #3E3E3E
pack .subpanel2.but5.lb2  -side left  -padx 20 
pack .subpanel2.but5 -side top;

frame .subpanel2.but3 -background #3E3E3E ;
pack .subpanel2.but3 -side top;
button .subpanel2.but3.b1 -text "Button5" -bg #3E3E3E;
pack .subpanel2.but3.b1  -side left -padx 20 ;
button .subpanel2.but3.b2 -text "Button6" -bg #3E3E3E;
pack .subpanel2.but3.b2  -side left -padx 20;

frame .subpanel2.but6 -background #3E3E3E ;
label .subpanel2.but6.lb1 -text "Best Collection" -fg white -bg #3E3E3E
pack .subpanel2.but6.lb1  -side left  -padx 20 
label .subpanel2.but6.lb2 -text "Print" -fg white -bg #3E3E3E
pack .subpanel2.but6.lb2  -side left  -padx 20 
pack .subpanel2.but6 -side top;

} -image [image create photo -file file.gif]  -bg #555555

bind  .subpanel1.b1 <Enter> {.subpanel1.b1 config -bg #999999;} 
bind  .subpanel1.b1 <Leave> {.subpanel1.b1 config -bg #555555}
pack .subpanel1.b1  -side top 

label .subpanel1.lb1 -text "File" -fg white -bg #555555
pack .subpanel1.lb1  -side top  

button .subpanel1.b2 -text "Button2" -image [image create photo -file edit.gif]   -command {
destroy .subpanel2.but1;
destroy .subpanel2.but2;
destroy .subpanel2.but3;
destroy .subpanel2.but4;
destroy .subpanel2.but5;
destroy .subpanel2.but6;

###[but] is sub frame of subpanel2###
frame .subpanel2.but1 -background #3E3E3E ;
#bind .subpanel2.but1 <Enter> {.subpanel2 config -bg red} 
#bind .subpanel2.but1 <Leave> {.subpanel2 config -bg white}

pack .subpanel2.but1 -side top;
button .subpanel2.but1.b1 -text "Button11" -bg #3E3E3E;
pack .subpanel2.but1.b1  -side left -padx 20 ;
button .subpanel2.but1.b2 -text "Button22" -bg #3E3E3E;
pack .subpanel2.but1.b2  -side left -padx 20  ;

frame .subpanel2.but4 -background #3E3E3E ;
label .subpanel2.but4.lb1 -text "Zoom In" -fg white -bg #3E3E3E
pack .subpanel2.but4.lb1  -side left  -padx 20 
label .subpanel2.but4.lb2 -text "Zoom Out" -fg white -bg #3E3E3E
pack .subpanel2.but4.lb2  -side left  -padx 20 
pack .subpanel2.but4 -side top;


frame .subpanel2.but2 -background #3E3E3E ;
pack .subpanel2.but2 -side top;
button .subpanel2.but2.b1 -text "Button33" -bg #3E3E3E;
pack .subpanel2.but2.b1  -side left -padx 20  ;
button .subpanel2.but2.b2 -text "Button44" -bg #3E3E3E;
pack .subpanel2.but2.b2  -side left -padx 20  ;

frame .subpanel2.but5 -background #3E3E3E ;
label .subpanel2.but5.lb1 -text "Full Screen" -fg white -bg #3E3E3E
pack .subpanel2.but5.lb1  -side left  -padx 20 
label .subpanel2.but5.lb2 -text "Click" -fg white -bg #3E3E3E
pack .subpanel2.but5.lb2  -side left  -padx 20 
pack .subpanel2.but5 -side top;

frame .subpanel2.but3 -background #3E3E3E ;
pack .subpanel2.but3 -side top;
button .subpanel2.but3.b1 -text "Button55" -bg #3E3E3E;
pack .subpanel2.but3.b1  -side left -padx 20  ;
button .subpanel2.but3.b2 -text "Button66" -bg #3E3E3E;
pack .subpanel2.but3.b2  -side left -padx 20 ;

frame .subpanel2.but6 -background #3E3E3E ;
label .subpanel2.but6.lb1 -text "Drag" -fg white -bg #3E3E3E
pack .subpanel2.but6.lb1  -side left  -padx 20 
label .subpanel2.but6.lb2 -text "Like" -fg white -bg #3E3E3E
pack .subpanel2.but6.lb2  -side left  -padx 20 
pack .subpanel2.but6 -side top;
 }  -bg #555555
bind  .subpanel1.b2 <Enter> {.subpanel1.b2 config -bg #999999;} 
bind  .subpanel1.b2 <Leave> {.subpanel1.b2 config -bg #555555}
pack .subpanel1.b2  -side top  
label .subpanel1.lb2 -text "Edit" -fg white -bg #555555
pack .subpanel1.lb2  -side top  

button .subpanel1.b3 -text "Button3" -image [image create photo -file share.gif] -command {
destroy .subpanel2.but1;
destroy .subpanel2.but2;
destroy .subpanel2.but3;
destroy .subpanel2.but4;
destroy .subpanel2.but5;
destroy .subpanel2.but6;
###[but] is sub frame of subpanel2###
frame .subpanel2.but1 -background #3E3E3E ;
#bind .subpanel2.but1 <Enter> {.subpanel2 config -bg red} 
#bind .subpanel2.but1 <Leave> {.subpanel2 config -bg white}

pack .subpanel2.but1 -side top;
button .subpanel2.but1.b1 -text "Button111" -bg #3E3E3E;
pack .subpanel2.but1.b1  -side left -padx 20 ;
button .subpanel2.but1.b2 -text "Button222" -bg #3E3E3E;
pack .subpanel2.but1.b2  -side left -padx 20  ;

frame .subpanel2.but4 -background #3E3E3E ;
label .subpanel2.but4.lb1 -text "Email" -fg white -bg #3E3E3E
pack .subpanel2.but4.lb1  -side left  -padx 20 
label .subpanel2.but4.lb2 -text "Facebook" -fg white -bg #3E3E3E
pack .subpanel2.but4.lb2  -side left  -padx 20 
pack .subpanel2.but4 -side top;


frame .subpanel2.but2 -background #3E3E3E ;
pack .subpanel2.but2 -side top;
button .subpanel2.but2.b1 -text "Button333" -bg #3E3E3E;
pack .subpanel2.but2.b1  -side left -padx 20  ;
button .subpanel2.but2.b2 -text "Button444" -bg #3E3E3E;
pack .subpanel2.but2.b2  -side left -padx 20 ;


frame .subpanel2.but5 -background #3E3E3E ;
label .subpanel2.but5.lb1 -text "Twitter" -fg white -bg #3E3E3E
pack .subpanel2.but5.lb1  -side left  -padx 20 
label .subpanel2.but5.lb2 -text "Instagram" -fg white -bg #3E3E3E
pack .subpanel2.but5.lb2  -side left  -padx 20 
pack .subpanel2.but5 -side top;


frame .subpanel2.but3 -background #3E3E3E ;
pack .subpanel2.but3 -side top;
button .subpanel2.but3.b1 -text "Button555" -bg #3E3E3E;
pack .subpanel2.but3.b1  -side left -padx 20   ;
button .subpanel2.but3.b2 -text "Button666" -bg #3E3E3E;
pack .subpanel2.but3.b2  -side left -padx 20 

frame .subpanel2.but6 -background #3E3E3E ;
label .subpanel2.but6.lb1 -text "Share Link" -fg white -bg #3E3E3E
pack .subpanel2.but6.lb1  -side left  -padx 20 
label .subpanel2.but6.lb2 -text "Contact Us" -fg white -bg #3E3E3E
pack .subpanel2.but6.lb2  -side left  -padx 20 
pack .subpanel2.but6 -side top;

 } -bg #555555
bind  .subpanel1.b3 <Enter> {.subpanel1.b3 config -bg #999999;} 
bind  .subpanel1.b3 <Leave> {.subpanel1.b3 config -bg #555555}
pack .subpanel1.b3  -side top 
label .subpanel1.lb3 -text "Share" -fg white -bg #555555
pack .subpanel1.lb3  -side top  


button .subpanel1.b4 -text "Button4" -bg #555555 -image [image create photo -file save.gif]
bind  .subpanel1.b4 <Enter> {.subpanel1.b4 config -bg #999999;} 
bind  .subpanel1.b4 <Leave> {.subpanel1.b4 config -bg #555555}
pack .subpanel1.b4  -side top  
label .subpanel1.lb4 -text "Save" -fg white -bg #555555
pack .subpanel1.lb4  -side top  

button .subpanel1.b5 -text "Button5" -bg #555555 -image [image create photo -file delete.gif]
bind  .subpanel1.b5 <Enter> {.subpanel1.b5 config -bg #999999;} 
bind  .subpanel1.b5 <Leave> {.subpanel1.b5 config -bg #555555}
pack .subpanel1.b5  -side top 
label .subpanel1.lb5 -text "Delete" -fg white -bg #555555
pack .subpanel1.lb5  -side top  

button .subpanel1.b6 -text "Button6" -image [image create photo -file help.gif] -bg #555555 
bind  .subpanel1.b6 <Enter> {.subpanel1.b6 config -bg #999999;} 
bind  .subpanel1.b6 <Leave> {.subpanel1.b6 config -bg #555555}
pack .subpanel1.b6  -side top  -pady 10
label .subpanel1.lb6 -text "Help" -fg white -bg #555555
pack .subpanel1.lb6  -side top



#Tool Bar 2

frame .subpanel2 -background #3E3E3E -height 800 -width 300
pack .subpanel2 -side left -fill both -expand true
###在每?frame的最底下加入label把frame?左到右?起?###
###width 40是最小化?工具?的?度（后期需要?整）###
label .subpanel2.label  -background #3E3E3E  -text "" -width 40
pack .subpanel2.label -side bottom





#Operation Field
frame .mainpanel -background #333333 -height 800 -width 1000
pack .mainpanel -side left -fill both -expand true
frame .mainpanel.top -background #333333  -width 1000
pack .mainpanel.top -side top -fill both
frame .mainpanel.top.ccc -background #333333  -height 20
pack .mainpanel.top.ccc -side bottom 
button .mainpanel.top.ccc.b1 -text "Button1" -image [image create photo -file picture.gif] -bg #555555
pack .mainpanel.top.ccc.b1  -side right  -padx 40
button .mainpanel.top.ccc.b2 -text "Button2" -image [image create photo -file portrait.gif] -bg #555555
pack .mainpanel.top.ccc.b2  -side right  -padx 40

frame .mainpanel.cen -background #333333  -width 1000
pack .mainpanel.cen -side top -fill both

##################################################
Canvas
##################################################
set t .mainpanel.cen
 set _paint(top) $t
 set _paint(width) 1100
 set _paint(height) 900

 set _paint(bg) #333333
 set _paint(color) white

 # Canvas

 set _paint(can) [canvas $t.c \
    -width $_paint(width) \
    -height $_paint(height) \
    -background $_paint(bg) \
    ]

 grid $_paint(can) -row 0 -column 0

 # Image

 set _paint(image) [image create photo \
    -width $_paint(width) \
    -height $_paint(height) \
    -palette 256/256/256 \
    ]

 # Canvas image item

 set _paint(image_id) [$_paint(can) create image \
    0 0 \
    -anchor nw \
    -image $_paint(image) \
    ]

 # Paint pixel at a X,Y coord

 proc Paint {x y} {
    global _paint

    if {$x >= 0 && $y >= 0} {
        $_paint(image) put $_paint(color) \
            -to $x $y \
                [expr {$x + 1}] [expr {$y + 1}]
    }
 }

 bind $_paint(can) <1> {Paint %x %y}
 bind $_paint(can) <B1-Motion> {Paint %x %y}

 # Button 3 will select a new paint color

 proc ChangeColor {} {
    global _paint
    set _paint(color) [tk_chooseColor]
    raise $_paint(top)
 }

 bind $_paint(can) <3> {ChangeColor}

##################################################
Canvas
##################################################

frame .mainpanel.bottom -background #555555  -width 1000
pack .mainpanel.bottom -side bottom -fill both


###Modifies by Yiran, Chen###
frame .mainpanel.bottom.ccc -background #555555 -height 20
pack .mainpanel.bottom.ccc -side bottom 
button .mainpanel.bottom.ccc.b1 -text "Button1" -image [image create photo -file picture.gif] -bg #555555
pack .mainpanel.bottom.ccc.b1  -side right  -padx 10 
button .mainpanel.bottom.ccc.b2 -text "Button2" -image [image create photo -file picture.gif] -bg #555555
pack .mainpanel.bottom.ccc.b2  -side right  -padx 10
###Modifies by Yiran, Chen###

###label must be at the end of mainpanel code###
label .mainpanel.label  -background #333333  -text "" -width 133
pack .mainpanel.label -side bottom


#Tool Bar 3
frame .subpanel3 -background #3E3E3E -height 800 -width 300
pack .subpanel3 -side left -fill both -expand true
label .subpanel3.label  -background #3E3E3E  -text "" -width 40
pack .subpanel3.label -side bottom



frame .subpanel3.ccc -background  #3e3e3e -height 20
pack .subpanel3.ccc -side bottom -pady 20
button .subpanel3.ccc.b1 -text "Button1" -bg #3e3e3e -command {
set w .toolframe;
toplevel $w;
wm title $w "Tool Box";
frame $w.subpanel -background #555555 -height 800 -width 300;
pack $w.subpanel -side left -fill both ;

frame $w.subpanel.but1 -background #3E3E3E ;
pack $w.subpanel.but1 -side top;
button $w.subpanel.but1.b1 -text "Button1" -bg #555555 -image [image create photo -file a.gif];
pack $w.subpanel.but1.b1  -side left  ;
button $w.subpanel.but1.b2 -text "Button2" -bg #555555 -image [image create photo -file b.gif];
pack $w.subpanel.but1.b2  -side left  ;


frame $w.subpanel.but2 -background #555555 ;
pack $w.subpanel.but2 -side top;
button $w.subpanel.but2.b1 -text "Button3" -bg #555555 -image [image create photo -file c.gif];
pack $w.subpanel.but2.b1  -side left  ;
button $w.subpanel.but2.b2 -text "Button4" -bg #555555 -image [image create photo -file d.gif];
pack $w.subpanel.but2.b2  -side left  ;

frame $w.subpanel.but3 -background #555555 ;
pack $w.subpanel.but3 -side top;
button $w.subpanel.but3.b1 -text "Button5" -bg #555555 -image [image create photo -file e.gif];
pack $w.subpanel.but3.b1  -side left  ;
button $w.subpanel.but3.b2 -text "Button6" -bg #555555 -image [image create photo -file f.gif];
pack $w.subpanel.but3.b2  -side left

frame $w.subpanel.but4 -background #555555 ;
pack $w.subpanel.but4 -side top;
button $w.subpanel.but4.b1 -text "Button5" -bg #555555 -image [image create photo -file g.gif];
pack $w.subpanel.but4.b1  -side left  ;
button $w.subpanel.but4.b2 -text "Button6" -bg #555555 -image [image create photo -file h.gif];
pack $w.subpanel.but4.b2  -side left

frame $w.subpanel.but5 -background #555555 ;
pack $w.subpanel.but5 -side top;
button $w.subpanel.but5.b1 -text "Button5" -bg #555555 -image [image create photo -file i.gif];
pack $w.subpanel.but5.b1  -side left  ;
button $w.subpanel.but5.b2 -text "Button6" -bg #555555 -image [image create photo -file j.gif];
pack $w.subpanel.but5.b2  -side left

frame $w.subpanel.but6 -background #555555 ;
pack $w.subpanel.but6 -side top;
button $w.subpanel.but6.b1 -text "Button5" -bg #555555 -image [image create photo -file k.gif];
pack $w.subpanel.but6.b1  -side left  ;
button $w.subpanel.but6.b2 -text "Button6" -bg #555555 -image [image create photo -file l.gif];
pack $w.subpanel.but6.b2  -side left

frame $w.subpanel.but7 -background #555555 ;
pack $w.subpanel.but7 -side top;
button $w.subpanel.but7.b1 -text "Button5" -bg #555555 -image [image create photo -file m.gif];
pack $w.subpanel.but7.b1  -side left  ;
button $w.subpanel.but7.b2 -text "Button6" -bg #555555 -image [image create photo -file n.gif];
pack $w.subpanel.but7.b2  -side left

frame $w.subpanel.but8 -background #555555 ;
pack $w.subpanel.but8 -side top;
button $w.subpanel.but8.b1 -text "Button5" -bg #555555 -image [image create photo -file o.gif];
pack $w.subpanel.but8.b1  -side left  ;
button $w.subpanel.but8.b2 -text "Button6" -bg #555555 -image [image create photo -file p.gif];
pack $w.subpanel.but8.b2  -side left

frame $w.subpanel.but9 -background #555555 ;
pack $w.subpanel.but9 -side top;
button $w.subpanel.but9.b1 -text "Button5" -bg #555555 -image [image create photo -file q.gif];
pack $w.subpanel.but9.b1  -side left  ;
button $w.subpanel.but9.b2 -text "Button6" -bg #555555 -image [image create photo -file r.gif];
pack $w.subpanel.but9.b2  -side left

frame $w.subpanel.but10 -background #555555 ;
pack $w.subpanel.but10 -side top;
button $w.subpanel.but10.b1 -text "Button5" -bg #555555 -image [image create photo -file s.gif];
pack $w.subpanel.but10.b1  -side left  ;
button $w.subpanel.but10.b2 -text "Button6" -bg #555555 -image [image create photo -file t.gif];
pack $w.subpanel.but10.b2  -side left


frame $w.subpanel.but11 -background #555555 ;
pack $w.subpanel.but11 -side top;
button $w.subpanel.but11.b1 -text "Button5" -bg #555555 -image [image create photo -file u.gif];
pack $w.subpanel.but11.b1  -side left  ;
button $w.subpanel.but11.b2 -text "Button6" -bg #555555 -image [image create photo -file v.gif];
pack $w.subpanel.but11.b2  -side left

frame $w.subpanel.but12 -background #555555 ;
pack $w.subpanel.but12 -side top;
button $w.subpanel.but12.b1 -text "Button5" -bg #555555 -image [image create photo -file w.gif];
pack $w.subpanel.but12.b1  -side left  ;
button $w.subpanel.but12.b2 -text "Button6" -bg #555555 -image [image create photo -file x.gif];
pack $w.subpanel.but12.b2  -side left


}
pack .subpanel3.ccc.b1  -side right  -padx 10 
button .subpanel3.ccc.b2 -text "Button2"  -command "destroy .toolframe" -bg #3E3E3E
pack .subpanel3.ccc.b2  -side right  -padx 10

set score "Red : 0    Yellow : 0    Blue : 0"
set red 0
set yellow 0
set blue 0

#display in the buttom
proc display {val} {
global red yellow blue score
set score [format {Red : %d    Yellow : %d    Blue : %d} $red $yellow $blue]
}

scale .subpanel3.red -label "Red" -variable red -background #555555 \
-length 5c -width .25c -from 0 -to 30 \
-orient horizontal -command {display}
scale .subpanel3.yellow -label "Yellow" -variable yellow -background #555555 \
-length 5c -width .25c -from 0 -to 30 \
-orient horizontal -command {display} 
scale .subpanel3.blue -label "Blue" -variable blue -background #555555 \
-length 5c -width .25c -from 0 -to 30 \
-orient horizontal -command {display}
label .subpanel3.score -background #3E3E3E -fg white -textvariable score

pack .subpanel3.score -side bottom -padx 2 -pady 2 
pack .subpanel3.red -side bottom -padx 2 -pady 2 
pack .subpanel3.yellow -side bottom -padx 2 -pady 2 
pack .subpanel3.blue -side bottom -padx 2 -pady 2
