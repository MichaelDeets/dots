#!/bin/sh
echo
echo "	Previous CPU profile:"
echo "	" $(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_driver) / $(cat /sys/devices/system/cpu/amd_pstate/status)
echo "	" $(cat /sys/devices/system/cpu/cpufreq/policy0/scaling_governor)

# gpu
echo "auto" > /sys/class/drm/card0/device/power_dpm_force_performance_level
echo "2" > /sys/class/drm/card0/device/pp_power_profile_mode 
echo "2" > /sys/class/drm/card0/device/pp_power_profile_mode 
echo "r" > /sys/class/drm/card0/device/pp_od_clk_voltage
# cpu
echo "passive" > /sys/devices/system/cpu/amd_pstate/status
pkill -f -i tuned
tuned --log /var/log/tuned.log --no-dbus --no-socket --profile powersave &
echo "powersave" | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
echo "power" | tee /sys/devices/system/cpu/cpufreq/policy*/energy_performance_preference
echo "0" | tee /sys/devices/system/cpu/cpufreq/policy*/boost

echo
echo "	Current/new CPU profile:"
echo "	" $(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_driver) / $(cat /sys/devices/system/cpu/amd_pstate/status)
echo "	" $(cat /sys/devices/system/cpu/cpufreq/policy0/scaling_governor)
echo

