### Raspberry pi setup instructions

For cameras using the camera interface, you need to run `raspi-config` and enable the camera interface. You will also need to ensure the correct driver is loaded:
`sudo modprobe bcm2835-v4l2`
and add the driver name to the end of `/etc/modules` to ensure it's loaded on subsequent boots.

Packages needed to run motion & mysql:
```
sudo apt-get update
sudo apt-get install motion
sudo apt-get install mysql
sudo apt-get install ruby-dev
sudo apt-get install libmysql++-dev
```

You'll need to create a user, DB, and tables (see sql files) and ensure the information is in your `motion.conf` (to come soon).
