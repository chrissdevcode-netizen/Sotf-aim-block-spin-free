local scriptToCopy = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/chrissdevcode-netizen/bqm-script-chriss/refs/heads/main/bqm.cs.lua"))()'

-- Servicios
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui") or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

-- Crear Interfaz
local UpdateGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local CopyButton = Instance.new("TextButton")
local ButtonCorner = Instance.new("UICorner")
local CloseButton = Instance.new("TextButton")
local UIStroke = Instance.new("UIStroke")

-- Configuración de ScreenGui
UpdateGui.Name = "UpdateNotifier"
UpdateGui.Parent = CoreGui
UpdateGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Configuración del Frame Principal
MainFrame.Name = "MainFrame"
MainFrame.Parent = UpdateGui
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 320, 0, 140)
MainFrame.BackgroundTransparency = 1 -- Para animación
MainFrame.ClipsDescendants = true

UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

UIStroke.Parent = MainFrame
UIStroke.Color = Color3.fromRGB(60, 60, 70)
UIStroke.Thickness = 1.5
UIStroke.Transparency = 1 


Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0, 0, 0.15, 0)
Title.Size = UDim2.new(1, 0, 0.3, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "¡Nueva actualización disponible solo para bqm no para block spin! 🔥"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 17.000
Title.TextTransparency = 1 


CopyButton.Name = "CopyButton"
CopyButton.Parent = MainFrame
CopyButton.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
CopyButton.Position = UDim2.new(0.15, 0, 0.55, 0)
CopyButton.Size = UDim2.new(0.7, 0, 0.3, 0)
CopyButton.Font = Enum.Font.GothamSemibold
CopyButton.Text = "Copiar Script"
CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyButton.TextSize = 15.000
CopyButton.AutoButtonColor = true
CopyButton.BackgroundTransparency = 1 
CopyButton.TextTransparency = 1

ButtonCorner.CornerRadius = UDim.new(0, 8)
ButtonCorner.Parent = CopyButton


CloseButton.Name = "CloseButton"
CloseButton.Parent = MainFrame
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.BackgroundTransparency = 1.000
CloseButton.Position = UDim2.new(0.88, 0, 0.05, 0)
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(150, 150, 150)
CloseButton.TextSize = 14.000
CloseButton.TextTransparency = 1 

local tweenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
TweenService:Create(MainFrame, tweenInfo, {BackgroundTransparency = 0}):Play()
TweenService:Create(UIStroke, tweenInfo, {Transparency = 0}):Play()
TweenService:Create(Title, tweenInfo, {TextTransparency = 0}):Play()
TweenService:Create(CopyButton, tweenInfo, {BackgroundTransparency = 0, TextTransparency = 0}):Play()
TweenService:Create(CloseButton, tweenInfo, {TextTransparency = 0}):Play()


CopyButton.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(scriptToCopy)
        

        TweenService:Create(CopyButton, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(85, 255, 127)}):Play()
        CopyButton.Text = "¡Copiado! ✅"
        
        
        task.wait(25)
        local fadeOut = TweenService:Create(MainFrame, TweenInfo.new(0.5), {BackgroundTransparency = 1})
        TweenService:Create(Title, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
        TweenService:Create(CopyButton, TweenInfo.new(0.5), {BackgroundTransparency = 1, TextTransparency = 1}):Play()
        TweenService:Create(CloseButton, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
        TweenService:Create(UIStroke, TweenInfo.new(0.5), {Transparency = 1}):Play()
        
        fadeOut:Play()
        fadeOut.Completed:Connect(function()
            UpdateGui:Destroy()
        end)
    else
        CopyButton.Text = "Error: setclipboard no soportado"
        TweenService:Create(CopyButton, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(255, 85, 85)}):Play()
    end
end)

CloseButton.MouseButton1Click:Connect(function()
    UpdateGui:Destroy()
end)

CloseButton.MouseEnter:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
end)

CloseButton.MouseLeave:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(150, 150, 150)}):Play()
end)
