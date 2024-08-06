
function Recipe.OnCreate.GetRandomReward(items, result, player)

  local stats = player:getStats()
  local bodyDamage = player:getBodyDamage();

  local moneyAmount = 0
  local stressChange = 0
  local happynessChange = 0

  local reward1 = 5
  local reward2 = 10
  local reward3 = 25
  local reward4 = 50

  local chance1 = 40
  local chance2 = 30
  local chance3 = 20
  local chance4 = 10

  local result = ZombRand(100)+1

  if result <= chance1 then

    if result <= chance4 then
      moneyAmount = reward4
      stressChange = -0.75
      happynessChange = -50
    elseif result <= chance3 then
      moneyAmount = reward3
      stressChange = -0.50
      happynessChange = -40
    elseif result <= chance2 then
      moneyAmount = reward2
      stressChange = -0.35
      happynessChange = -30
    elseif result <= chance1 then
      moneyAmount = reward1
      stressChange = -0.25
      happynessChange = -20
    end

  else
    stressChange = 0.20
    happynessChange = 10
  end

  if result <= chance1 then
    for i = 1, moneyAmount do
      player:getInventory():AddItem("Base.Money", moneyAmount)
    end
    player:Say("¡I've Won $" .. moneyAmount .. "!")
  else
    player:Say("I Lost..")
  end

  stats:setStress(stats:getStress() + stressChange)
  if stats:getStress() < 0 then
    stats:setStress(0)
  end

  bodyDamage:setUnhappynessLevel(bodyDamage:getUnhappynessLevel() + happynessChange)
  if bodyDamage:getUnhappynessLevel() < 0 then
    bodyDamage:setUnhappynessLevel(0)
  end

end
