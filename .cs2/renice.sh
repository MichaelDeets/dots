#!/bin/sh
echo
echo "	Previous CPU profile:"
echo "	" $(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_driver) / $(cat /sys/devices/system/cpu/amd_pstate/status)
echo "	" $(cat /sys/devices/system/cpu/cpufreq/policy0/scaling_governor)

# gpu
echo "293000000" | tee /sys/class/drm/card0/device/hwmon/hwmon*/power1_cap
echo "performance" > /sys/class/drm/card0/device/power_dpm_state

echo "profile_peak" > /sys/class/drm/card0/device/power_dpm_force_performance_level
echo "1" > /sys/class/drm/card0/device/pp_power_profile_mode
echo "1" > /sys/class/drm/card0/device/pp_power_profile_mode
echo "c" > /sys/class/drm/card0/device/pp_od_clk_voltage
#echo "s 0 2340" > /sys/class/drm/card0/device/pp_od_clk_voltage
#echo "s 1 2800" > /sys/class/drm/card0/device/pp_od_clk_voltage
#echo "m 0 950" > /sys/class/drm/card0/device/pp_od_clk_voltage
#echo "m 1 1075" > /sys/class/drm/card0/device/pp_od_clk_voltage
# cpu
echo "active" > /sys/devices/system/cpu/amd_pstate/status
#echo "1" > /sys/devices/system/cpu/cpufreq/boost
#echo "1" | tee /sys/devices/system/cpu/cpufreq/policy*/boost
pkill -f -i tuned
#tuned --log /var/log/tuned.log --no-socket --profile latency-performance &
cpupower frequency-set -g performance
echo "performance" | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
echo "performance" | tee /sys/devices/system/cpu/cpufreq/policy*/energy_performance_preference

echo
echo "	Current/new CPU profile:"
echo "	" $(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_driver) / $(cat /sys/devices/system/cpu/amd_pstate/status)
echo "	" $(cat /sys/devices/system/cpu/cpufreq/policy0/scaling_governor)
echo

