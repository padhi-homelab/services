#!/bin/sh

cd /usr/src/homeassistant/homeassistant/components/opower

patch sensor.py << 'EOF'
--- sensor_old.py	2025-02-16 19:45:11.286281038 -0800
+++ sensor.py	    2025-02-16 19:46:08.936280167 -0800
@@ -28,7 +28,7 @@
 class OpowerEntityDescription(SensorEntityDescription):
     """Class describing Opower sensors entities."""
 
-    value_fn: Callable[[Forecast], str | float]
+    value_fn: Callable[[Forecast], str | float | date]
 
 
 # suggested_display_precision=0 for all sensors since
@@ -96,7 +96,7 @@
         device_class=SensorDeviceClass.DATE,
         entity_category=EntityCategory.DIAGNOSTIC,
         entity_registry_enabled_default=False,
-        value_fn=lambda data: str(data.start_date),
+        value_fn=lambda data: data.start_date,
     ),
     OpowerEntityDescription(
         key="elec_end_date",
@@ -104,7 +104,7 @@
         device_class=SensorDeviceClass.DATE,
         entity_category=EntityCategory.DIAGNOSTIC,
         entity_registry_enabled_default=False,
-        value_fn=lambda data: str(data.end_date),
+        value_fn=lambda data: data.end_date,
     ),
 )
 GAS_SENSORS: tuple[OpowerEntityDescription, ...] = (
@@ -168,7 +168,7 @@
         device_class=SensorDeviceClass.DATE,
         entity_category=EntityCategory.DIAGNOSTIC,
         entity_registry_enabled_default=False,
-        value_fn=lambda data: str(data.start_date),
+        value_fn=lambda data: data.start_date,
     ),
     OpowerEntityDescription(
         key="gas_end_date",
@@ -176,7 +176,7 @@
         device_class=SensorDeviceClass.DATE,
         entity_category=EntityCategory.DIAGNOSTIC,
         entity_registry_enabled_default=False,
-        value_fn=lambda data: str(data.end_date),
+        value_fn=lambda data: data.end_date,
     ),
 )

EOF
