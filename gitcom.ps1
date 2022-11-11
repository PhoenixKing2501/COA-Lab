git add -A
if ($?) { git commit -m "$($Args[0])" }
