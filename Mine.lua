scriptId = 'com.eric.mine.craft'
scriptTitle = "Hopefully this works"
scriptDetailsUrl = ""

movement = 0
jump = 0
fall = 0

function activeAppName()

  return(activeApp)

end


function onForegroundWindowChange(app, title)

  return true

end


function onActiveChange(isActive)

  if(isActive) then
    myo.debug("active")
  else
    myo.debug("inactive")
  end

end

function mousePoseControl(pose, edge)

end

function onPoseEdge(pose, edge)

  myo.debug("pose:" .. pose)
  myo.debug("edge:" .. edge)

  mousePoseControl(pose, edge)

  if(pose == "fist") then
    movement = 1 - movement
  elseif(pose == "fingersSpread") then
    jump = 1 - jump
  elseif(pose == "waveOut") then
    myo.mouse("left", "press")
  elseif(pose == "waveIn") then
    fall = 1 - fall
  end

end

function onPeriodic()

  if(centerMode) then
    myo.centerMousePosition()
  end

  if(movement) then
    myo.keyboard("w", "down")
  else
    myo.keyboard("w", "up")
  end

  if(jump) then
    myo.keyboard("space", "down")
  else
    myo.keyboard("space", "up")
  end

  if(fall) then
    myo.keyboard("left_shift", "down")
  else
    myo.keyboard("left_shift", "up")
  end

end

myo.controlMouse(true)
