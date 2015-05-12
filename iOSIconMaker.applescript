set filePath to get (choose file of type {"png"})
set imagePath to get POSIX path of filePath

display dialog "Please Select.
iOS:7,8
AppleWatch:38mm 42mm" buttons {"iOS", "AppleWatch", "ƒLƒƒƒ“ƒZƒ‹"}
set selectType to button returned of result
if selectType = "iOS" then
	set sizes to {58, 76, 87, 80, 120, 152, 180}
else if selectType = "AppleWatch" then
	set sizes to {48, 55, 80, 88, 172, 196}
else
	return
end if


tell application "Finder"
	set saveDirectory to get (folder of filePath as Unicode text)
	set fileName to name of filePath as Unicode text
end tell

repeat with size in sizes
	tell application "Image Events"
		launch
		set img to open imagePath
		scale img to size size
		set imgName to (size as string) & "x" & (size as string) & "_" & fileName
		save img in file (saveDirectory & imgName) as PNG
		close img
	end tell
end repeat