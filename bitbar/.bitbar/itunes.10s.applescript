#!/usr/bin/env osascript

on run argv
	if application "iTunes" is not running then
		return ""
	end if

	try
		tell application "iTunes"
			with timeout of 2 seconds
				if player state is playing then
					set currentTrack to name of current track as string
					set currentArtist to artist of current track as string

					return currentTrack & " by " & currentArtist
				else
					return ""
				end if
			end timeout
		end tell
	on error message
		return ""
	end try
end run
