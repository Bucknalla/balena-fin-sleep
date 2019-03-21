echo "Unloading ftdi_sio module..."
modprobe -r ftdi_sio
echo "Unloaded FTDI module"
sleep 3
chmod +x app/ftdi.sh
echo "Opening screen terminal"
screen -dmS ftdi_program  "./app/ftdi.sh"
echo "Opened screen terminal"
sleep 5
{ sleep 5; echo "reset"; echo "program app/firmware/bootloader.s37"; echo "program app/firmware/sleep-example.hex"; echo "reset"; sleep 10; } | telnet localhost 4444
echo "Loading Serial USB"
modprobe ftdi_sio
sleep 5
tail -f /dev/null
