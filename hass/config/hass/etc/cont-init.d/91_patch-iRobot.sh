#!/bin/sh

cd /usr/src/homeassistant/homeassistant/components/roomba

# NOTE: Patch
#

patch vacuum.py << 'EOF'
--- vacuum_old.py       2025-02-16 19:36:03.612955976 -0800
+++ vacuum.py           2025-02-16 19:36:13.959622486 -0800
@@ -177,8 +177,9 @@
             theta = pos_state.get("theta")
             if all(item is not None for item in (pos_x, pos_y, theta)):
                 position = f"({pos_x}, {pos_y}, {theta})"
             state_attrs[ATTR_POSITION] = position
+        state_attrs["RAW_STATE_EXTRA"] = state
 
         return state_attrs
 
     def get_cleaning_status(self, state) -> tuple[int, int]:
EOF
