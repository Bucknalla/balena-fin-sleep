# BalenaFin Coprocessor Sleep Example

To run the script:

```
$ cd app
$ python main.py TIME PIN INIT_STATE
```

Where `TIME` is the period (in milliseconds) to hold the pin for, `PIN` is the gpio pin (16 is the 3v3 power rail) and `INIT_STATE` is the initial state of the pin (1 = HIGH, 0 = LOW).
