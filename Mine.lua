scriptId = 'com.eric.mine.craft'
scriptTitle = "Hopefully this works"
scriptDetailsUrl = ""

function activeAppName()

  return(activeApp)

end


function onForegroundWindowChange(app, title)

  if(app == "JAVAW.EXE") then
    myo.debug("Correct Window")
    return true
  else
    return false
  end

end


function onActiveChange(isActive)

  if(isActive) then
    myo.debug("active")
  else
    myo.debug("inactive")
  end

end

function mousePoseControl(pose, edge)

  if(pose == "") then
  end

end

function onPoseEdge(pose, edge)

  myo.debug("pose:" .. pose)
  myo.debug("edge:" .. edge)

  mousePoseControl(pose, edge)

end

function onPeriodic()

  if(centerMode) then
    myo.centerMousePosition()
  end

end

myo.controlMouse(true)
