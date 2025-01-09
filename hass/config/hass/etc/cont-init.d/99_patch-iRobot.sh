#!/bin/bash

set -e

apk add --no-cache patch

cd /usr/src/homeassistant/homeassistant/components/roomba

patch vacuum.py << 'EOF'
--- vacuum_old.py       2025-01-07 22:43:17.728000000 -0700
+++ vacuum.py   2025-01-07 22:54:40.875000000 -0700
@@ -178,7 +178,8 @@
             if all(item is not None for item in (pos_x, pos_y, theta)):
                 position = f"({pos_x}, {pos_y}, {theta})"
             state_attrs[ATTR_POSITION] = position
 
+        state_attrs["RAW_STATE_EXTRA"] = state
         return state_attrs
 
     def get_cleaning_status(self, state) -> tuple[int, int]:
EOF
