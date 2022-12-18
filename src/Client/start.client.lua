local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)

Knit.Packages = game:GetService("ReplicatedStorage").Packages -- Expose packages
Knit.Utilies = game:GetService("ReplicatedStorage").Shared.Utilities -- Expose utilities
Knit.AddControllers(script.Parent.Controllers) -- Load controllers

Knit.Start():catch(warn)