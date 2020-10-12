# Newest WMs such as awesome are non-re-parenting.
# That cause bug with some Java apps.
# This line informe the JDK that our WM don't re-parent.
# This fix works for OpenJDK but not SunJDK. :(
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'