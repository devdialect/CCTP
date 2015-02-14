-- CCTP_Debug
-- Author: Gilgamesch
-- DateCreated: 9/15/2013 12:23:25 PM
--------------------------------------------------------------
OnLoadCCTPMain()
--check to make sure all expected SQL files were loaded to end of file
	local expectedSQLfiles = {	'Technology_PrereqTechs.sql'	}
	local bAnyErrors = false
	for i = 1, #expectedSQLfiles do
		local expectedFile = expectedSQLfiles[i]
		local bLoaded = false
		for row in GameInfo.EaDebugTableCheck() do
			if expectedFile == row.FileName then
				bLoaded = true
				break
			end
		end
		if not bLoaded then
			bAnyErrors = true
			print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
			print("!!!! ERROR: "..expectedFile.." was not loaded to end of file !!!!")
			print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		end
	end
	if not bAnyErrors then
		print("All expected SQL and XML files loaded to end of file...")
	end

end

--at end of file
OnLoadCCTPMain()