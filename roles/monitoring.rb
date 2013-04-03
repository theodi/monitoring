name "monitoring"
description "Monitoring server"
run_list(
  "recipe[icinga::server]"
)