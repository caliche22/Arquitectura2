view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 37ns -dutycycle 50 -starttime 0ms -endtime 1ms sim:/procesadormonociclo/Clock 
wave create -driver freeze -pattern clock -initialvalue 0 -period 37ns -dutycycle 50 -starttime 0us -endtime 100us sim:/procesadormonociclo/Clock 
WaveCollapseAll -1
wave clipboard restore
