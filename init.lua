minetest.register_on_joinplayer(function(player, last_login)
  local fs = player:get_inventory_formspec()
  local ast = formspec_ast.parse(fs)
  local headers = {size = true, position = true, anchor = true, no_prepend = true, real_cordinates = true}
  local index = 0
  for key, val in pairs(ast) do
    if type(val) == "table" and val.type and headers[val.type] then
      if key > index then index = key end
    end
  end
  table.insert(ast, index+1, {type="style_type", selectors={"image_button"}, props={border=false}})
  table.insert(ast, index+1, {type="bgcolor", bgcolor="#0000"})
  player:set_inventory_formspec(formspec_ast.unparse(ast))
--  minetest.log(minetest.get_player_by_name("singleplayer"):get_inventory_formspec())
end)