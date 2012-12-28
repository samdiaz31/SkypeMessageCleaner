-- SkypeMessageCleaner.lua
-- Created with SQLiteManager 4.0.1
-- Created by: Sam Diaz // WhatSam.com
-- On Friday, December 28, 2012

userName = Dialogs:GetValue("User to Scrub", "Enter username:")
if (userName == false) then return end

rs = Database:SQLSelect("SELECT count(*) FROM Messages WHERE author = '" .. userName .. "' OR dialog_partner = '" .. userName .. "'")
if (rs == nil) then return end

del = Dialogs:Question("There are " .. rs:Value(1) .. " messages to/from " .. userName, "Are you sure you wish to delete all " .. rs:Value(1) .. " messages?")
if (del) then
  delx2 = Dialogs:Question("ARE YOU", "SURE?")
  if (delx2) then
    poof = Database:SQLSelect("DELETE FROM Messages WHERE author = '" .. userName .. "' OR dialog_partner = '" .. userName .. "'")
    Dialogs:Message("POOF! What were we talking about?")
  else
    Dialogs:Message("OK, nothing has been deleted")
  end
else
  Dialogs:Message("OK, nothing has been deleted")
end

Dialogs:Message("Your secret is safe with me ;)")