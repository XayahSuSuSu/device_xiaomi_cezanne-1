LOGDIR=/data/local
COOLFILE=$LOGDIR"/water_cooling_check.txt"
echo "water_test" > /sys/power/wake_lock
stop mi_thermald
echo 1 > /sys/class/power_supply/battery/input_suspend

for i in `ls /sys/class/thermal/ | grep thermal_zone`;
do
        if [ `cat /sys/class/thermal/${i}/type` = "mtktsAP" ] ; then
                export ap="/sys/class/thermal/${i}/temp"
        elif [ `cat /sys/class/thermal/${i}/type` = "mtktscpu" ] ; then
                export cpu="/sys/class/thermal/${i}/temp"
        elif [ `cat /sys/class/thermal/${i}/type` = "mtktsbtsmdpa" ] ; then
                export smdpa="/sys/class/thermal/${i}/temp"
        fi
done

ap_start=($(cat $ap))
echo -n "ap_start = $ap_start"
echo -n "ap_start = $ap_start" > $COOLFILE
echo  " " >> $COOLFILE

cpu_start=($(cat $cpu))
echo -n "cpu_start = $cpu_start"
echo -n "cpu_start = $cpu_start" >> $COOLFILE
echo  " " >> $COOLFILE

smdpa_start=($(cat $smdpa))
echo -n "smdpa_start = $smdpa_start"
echo -n "smdpa_start = $smdpa_start" >> $COOLFILE
echo  " " >> $COOLFILE


echo "cpu6 1478400" > /sys/class/thermal/thermal_message/cpu_limits
echo "cpu7 1516800" > /sys/class/thermal/thermal_message/cpu_limits


j=1;
while [ j -le 8 ]
do
	while true;do done &
	j=$j+1;
done

i=1
while [ i -le 120 ]
do
	i=$i+1
	sleep 1
done

ap_end=($(cat $ap))
echo -n "ap_end = $ap_end"  >> $COOLFILE
echo  " " >> $COOLFILE

cpu_end=($(cat $cpu))
echo -n "cpu_end = $cpu_end"  >> $COOLFILE
echo  " " >> $COOLFILE

smdpa_end=($(cat $smdpa))
echo -n "smdpa_end = $smdpa_end"  >> $COOLFILE
echo  " " >> $COOLFILE


start mi_thermald
echo 0 > /sys/class/power_supply/battery/input_suspend

echo "Finished"

pkill sh
