#!/bin/bash

set -e

apk add --no-cache patch

cd /usr/src/homeassistant/homeassistant/components/roomba

patch entity.py << 'EOF'
--- entity_old.py  2024-10-04 20:26:44.387000000 -0700
+++ entity.py      2024-10-04 20:27:36.995000000 -0700
@@ -182,7 +182,7 @@
         software_version = state.get("softwareVer")
 
         # Set properties that are to appear in the GUI
-        state_attrs = {ATTR_SOFTWARE_VERSION: software_version}
+        state_attrs = {ATTR_SOFTWARE_VERSION: software_version, "RAW_STATE": state}
 
         # Set legacy status to avoid break changes
         state_attrs[ATTR_STATUS] = self.vacuum.current_state
EOF

patch braava.py << 'EOF'
--- braava_old.py       2023-07-26 22:40:16.438000000 -0700
+++ braava.py   2023-07-26 22:41:03.026000000 -0700
@@ -124,5 +124,6 @@
         state_attrs[ATTR_LID_CLOSED] = lid_closed
         state_attrs[ATTR_TANK_PRESENT] = tank_present
         state_attrs[ATTR_TANK_LEVEL] = tank_level
+        state_attrs["RAW_STATE_EXTRA"] = state
 
         return state_attrs
EOF

patch roomba.py << 'EOF'
--- roomba_old.py       2023-07-26 22:43:17.728000000 -0700
+++ roomba.py   2023-07-26 22:54:40.875000000 -0700
@@ -28,6 +28,7 @@
         """Return the state attributes of the device."""
         state_attrs = super().extra_state_attributes
 
+        state_attrs["RAW_STATE_EXTRA"] = self.vacuum_state
         # Get bin state
         bin_raw_state = self.vacuum_state.get("bin", {})
         bin_state = {}
EOF
