import json
import click

from config import STATE_DIR
from data import MonitorData
from services.fs import fs
from services.ddcutil import DDCUtil

ddcutil = DDCUtil(6)


@click.command()
def main():
    data = fs.read_from_file(f"{STATE_DIR}/monitor_data.json")
    monitor_data = MonitorData(**json.loads(data))
    ddcutil.set_brightness(str(monitor_data.brightness))
    ddcutil.set_contrast(str(monitor_data.contrast))


if __name__ == "__main__":
    main()
