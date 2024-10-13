-- Turtle

-- To Do
-- * move forward
-- * make it quarry 
-- * make it drop off inventory
-- * refuel?
-- * Check if enough fuel for quarry
-- * Make it trackable? 

function Inputs()
    -- Will be input questions later
    -- the Z is 1 layer above the layer you mine
        X = 16
        Y = 16
        Z = 4

        print("Please write your X, Y, Z for the Quarry. Place a , between each number")
        X, Y, Z = io.read()
    end

function Quarry(Inputs)
    LocalX = (Inputs.X - 1)
    LocalY = Inputs.Y
    LocalZ = Inputs.Z

    TurnCheck = 0

    Digging = true

    ----Runs until Z has been completed, thereby reseting Y for each run
    while LocalZ ~= 0 do
        
        --Runs until Y has been completed, thereby reseting X for each run
        while LocalY ~= 0 do
            
            -- run the X cordinate until 0
            while LocalX ~= 0 do
            
                -- Checks if something is in front, and keep checking until nothing (incase of falling block)
                while turtle.detect == true do
                    turtle.dig()
                    turtle.sleep(1)
                end
            
                -- Checks if something is under
                if turtle.detectDown then
                    turtle.digDown()
                end
            
                -- Checjs if something is above
                if turtle.detectUp then
                    turtle.digUp()
                end

                -- Move forward and reduces X by 1
                turtle.forward()
                LocalX = (LocalX - 1)

            end
            
            -- Rests the X 
            print("Completed X run")
            LocalX = Inputs.X
            
            -- Checks if it needs to turn left or right
            -- if 0 then left, if 0.5 then right
            if TurnCheck == 0  then
                turtle.turnLeft()
            else 
                turtle.turnRight()
            end
                -- Checks if something is in front, and keep checking until nothing (incase of falling block)
            while turtle.detect == true do
                turtle.dig()
            end
                    
            -- Checks if something is under
            if turtle.detectDown then
                turtle.digDown()
            end
                
            -- Checks if something is above
            if turtle.detectUp then
                turtle.digUp()
            end

            -- Move forward into next lane
            -- if 0 then left, if 0.5 then right
            turtle.forward()
            if TurnCheck == 0  then
                turtle.turnLeft()
            else 
                turtle.turnRight()
            end

            LocalY = (LocalY - 1)
            TurnCheck = (TurnCheck + 1)
            print("Completed a turn")

        end
        print("Layer Done")
        LocalY = Inputs.Y

        -- Changes layer and turns around
        --Direction doesn't actually matter here i just don't wanna rewrite it :3
        --We love copying your own broken code
        if TurnCheck == 0  then
            turtle.turnLeft()
            turtle.turnLeft()
        else 
            turtle.turnRight()
            turtle.turnRight()
        end

        if (LocalZ >= 3) then
            for i = 1, 3, 1 do
                turtle.digDown()
                LocalZ = (LocalZ -3)
            end

        elseif (LocalY &2) == 0 then
            for i = 1, 2, 1 do
                turtle.digDown()
                LocalZ = (LocalZ -2)
            end

        else
            turtle.digDown()
            LocalZ = (LocalZ -1)
        end 
        
    end
    
    -- Just a print to mark it as done
    print("Quarry Complete")
end

-- need to wrap LocalX in LocalZ to make it run the entire layer before moving down?
-- Figure out the LocalY properly, don't think its correct currently
-- Make it check in front twice before it moves, in case gravel.
--
