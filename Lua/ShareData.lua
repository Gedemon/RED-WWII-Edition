-- vymdt.01.2010.11.20.0000
-- Created by: Ryan F. Mercer -Open source
--===========================================================================
-- ShareData.lua
--===========================================================================
--[[
Manages custom super and context globals accessible to all lua states.
]]
--===========================================================================
--[[
Global Variables.
]]
g_super    = {};
g_context  = {};
--===========================================================================
--[[
Adds boolean case for given key for given context to automatic integer-key
for given table.  Adds boolean case for given key for global context to
automatic integer-key for given table when context not given.
]]
function onHasShared( key, tbl, context )
  local t = type( key );
  if not (t == "number" or (t == "string" and key ~= "")) then
    print( "onHasSession(): Invalid first argument of type "..t
        ..", expected number, or unempty-string." );
    return false; --error.
  end
  local t = type( tbl );
  if not t == "table" then
    print( "onHasSession(): Invalid second argument of type "..t
        ..", expected table." );
    return false; --error.
  end
  local t = type( context );
  if not (t == "nil" or (t == "string" and context ~= "")) then
    print( "onHasSession(): Invalid third argument of type "..t
        ..", expected nil, or unempty-string." );
    return false; --error.
  end
  if context == nil then
    if g_super[key] ~= nil then table.insert( tbl, true );
    else table.insert( tbl, false );
    end
  else
    if type( g_context[context] ) == "table" and
        g_context[context][key] ~= nil then table.insert( tbl, true );
    else table.insert( tbl, false );
    end
  end
end
LuaEvents.HasShared.Add( onHasShared );
--===========================================================================
--[[
Sets given value to given key for given context.  Sets given value to given
key for global context when context not given.  Sets given value to automatic
integer-key when key not given.  Can optionally add previous value for given
key to given key for given table, providing remove and replace functionality.
]]
function onSetShared( key, value, context, tbl )
  local t = type( key );
  if not (t == "nil" or t == "number" or (t == "string" and key ~= "")) then
    print( "onSetSession(): Invalid first argument of type "..t
        ..", expected nil, number, or unempty-string." );
    return false; --error.
  end
  local t = type( value );
  if not (t ~= "function" and t ~= "userdata" and t ~= "thread") then
    print( "onSetSession(): Invalid second argument of type "..t
        ..", expected nil, number, string, boolean, or table." );
    return false; --error.
  end
  local t = type( context );
  if not (t == "nil" or (t == "string" and context ~= "")) then
    print( "onSetSession(): Invalid third argument of type "..t
        ..", expected nil, or unempty-string." );
    return false; --error.
  end
  local t = type( tbl );
  if not (t == "nil" or t == "table") then
    print( "onSetSession(): Invalid fourth argument of type "..t
        ..", expected nil, or table." );
    return false; --error.
  end
  if context ~= nil then
    g_context[context] = g_context[context] or {};
    if key ~= nil then
      if tbl ~= nil then tbl[key] = g_context[context][key]; end
      g_context[context][key] = value;
    else table.insert( g_context[context], value ); --automatic integer key.
    end
  else
    if key ~= nil then
      if tbl ~= nil then tbl[key] = g_super[key]; end
      g_super[key] = value; 
    else table.insert( g_super, value ); --automatic integer key.
    end
  end
end
LuaEvents.SetShared.Add( onSetShared );
--===========================================================================
--[[
Adds value for given key for given context to given key for given table.
Adds value for given key for global context to given key for given table when
context not given.  Adds all values to keys for given context to given table
when key not given.  Adds all values to keys for global context to given
table when key and context not given.  Adds entire context table to context
key for given table for all contexts when given context boolean true.
]]
function onGetShared( key, tbl, context )
  local t = type( key );
  if not (t == "nil" or t == "number" or (t == "string" and key ~= "")) then
    print( "onGetSession(): Invalid first argument of type "..t
        ..", expected nil, number, or unempty-string." );
    return false; --error.
  end
  local t = type( tbl );
  if not t == "table" then
    print( "onGetSession(): Invalid second argument of type "..t
        ..", expected table." );
    return false; --error.
  end
  local t = type( context );
  if not (t == "nil" or (t == "string" and context ~= "")
      or context == true) then
    print( "onGetSession(): Invalid third argument of type "..t
        ..", expected nil, unempty-string, or boolean true" );
    return false; --error.
  end
  if context ~= nil then
    if context ~= true then
      if key ~= nil then
        if type( g_context[context] ) == "table" and
            g_context[context][key] ~= nil then
          tbl[key] = g_context[context][key];
        end
      else for k,v in pairs( g_context[context] ) do tbl[k] = v; end
      end
    else for k,v in pairs( g_context ) do tbl[k] = v; end
    end
  else
    if key ~= nil then
      if g_super[key] ~= nil then tbl[key] = g_super[key]; end
    else for k,v in pairs( g_super ) do tbl[k] = v; end
    end
  end
end
LuaEvents.GetShared.Add( onGetShared );
--===========================================================================
--END ShareData.lua
--===========================================================================
-- Created by: Ryan F. Mercer -Open source
