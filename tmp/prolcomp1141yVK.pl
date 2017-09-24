connect(room1, room2).
connect(room2, room1).

connect(room2 room3).
connect(room3, room2).

connect(room3, room4).
connect(room4, room3).

inRoom(shaky, room1).
inRoom(redBox, room4).

inRoom(Object, RoomY):-
    % append on stack
    inRoom(Object, RoomX),
    connect(RoomX, RoomY).

get(Box, Agent):-
    % append on stack
    inRoom(Agent, RoomX),
    inRoom(Box, RoomX).
