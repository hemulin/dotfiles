#!/usr/bin/env python
import subprocess


def main():
    process = subprocess.Popen(
        ['pactl', 'list', 'short', 'sinks'], stdout=subprocess.PIPE)
    out, err = process.communicate()
    if err is None:
        lines = out.split('\n')
        last = lines[-2]  # real last is empty breakline
        relevant = last.split('\t')
        if 'bluez' in relevant[1]:
            sink_num = relevant[0]
            process = subprocess.Popen(
                ['pacmd', 'set-default-sink', '{}'.format(sink_num)], stdout=subprocess.PIPE)
            out, err = process.communicate()
            if err is None:
                print("BT device connected")
            else:
                print("Error in setting default sink: {}".format(err))
        else:
            print("No BT device could be found in available sinks")


if __name__ == '__main__':
    main()
