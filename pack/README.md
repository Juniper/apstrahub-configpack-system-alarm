# System Alarm Config Pack

## What does this Config Pack Do

This config pack creates the iba elements required to create a Dashboard showing which devices have system alarms.

## JunOS Compatibility
This Config Pack will work with version 21.2r2+ on JunOS families junos, junos-ex and junos-qfx

## Components

| Component | Name          | Description                                                             |
|-----------|---------------|-------------------------------------------------------------------------|
|Service Registry | System_Alarms | Service description for the System Alarm collector                      |
|Custom Collector| System_Alarms | Custom Collector that reads the System Alarms                           |
|Probe| System_Alarms | Probe that consumes the collector output  |
|Dashboard| System Alarms | Dashboard that consumes the Probe                                       |                                              |

