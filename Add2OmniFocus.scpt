on run argv
  tell application "OmniFocus" to tell default document
    parse tasks with transport text argv
  end tell
end run
