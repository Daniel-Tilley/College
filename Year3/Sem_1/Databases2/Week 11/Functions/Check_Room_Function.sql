create or replace function check_room (rmno room.roomno%type) return boolean
is
rnumber room.roomno%type;
begin
  select roomno into rnumber from room where roomno like rmno;
  return true;
exception
  when no_data_found then
    return false;
end check_room;