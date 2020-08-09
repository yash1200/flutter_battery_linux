//
//  Generated file. Do not edit.
//

#include "generated_plugin_registrant.h"

#include <battery/battery_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) battery_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "BatteryPlugin");
  battery_plugin_register_with_registrar(battery_registrar);
}
