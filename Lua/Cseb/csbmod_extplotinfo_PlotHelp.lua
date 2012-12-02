--
-- Replace the logic in PlotHelpText.lua with our own code. Since this is heavily modified, it was best to just override the whole file
-- Author: csebal (based on the original lua files from CIV5)
--

--
-- The info panel functionality was removed, make sure it is hidden. (There are probably other ways to hide it as well,
-- but this was the easiest one for me)
--

function OnMouseOverHex( hexX, hexY )
	Controls.TextBox:SetHide(true);
end
Events.SerialEventMouseOverHex.Add( OnMouseOverHex );
