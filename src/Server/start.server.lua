local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)

Knit.Packages = game:GetService("ReplicatedStorage").Packages -- Expose packages
Knit.Utilities = game:GetService("ReplicatedStorage").Shared.Utilities -- Expose utilities
Knit.AddServices(script.Parent.Services) -- Load services

Knit.Start():catch(warn)