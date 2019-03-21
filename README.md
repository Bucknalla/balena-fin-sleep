# BalenaFin Coprocessor Sleep Example

To run the script, ssh into the main container and run the following commands:

```
$ cd app
$ python main.py TIME PIN INIT_STATE
```

Where `TIME` is the period (in milliseconds) to hold the pin for, `PIN` is the gpio pin (16 is the 3v3 power rail) and `INIT_STATE` is the initial state of the pin (1 = HIGH, 0 = LOW). Note - 3v3 power rail (gpio 16) should be set to initial state of 0 (LOW) in order to power down the compute module.

If no `args` are passed to `main.py` the fin will attempt to sleep for 10 seconds (10000, 16, 0).
