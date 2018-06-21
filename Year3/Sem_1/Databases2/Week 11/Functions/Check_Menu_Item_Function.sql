create or replace function check_menu_item (itemnm menuitem.itemname%type) return boolean
is
iname menuitem.itemname%type;
begin
  select itemname into iname from menuitem where itemname like itemnm;
  return true;
exception
  when no_data_found then
    return false;
end check_menu_item;