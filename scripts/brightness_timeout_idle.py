import json
import click

from config import STATE_DIR
from data import MonitorData
from services.fs import fs
from services.ddcutil import DDCUtil

ddcutil = DDCUtil(6)


@click.command
@click.option("--brightness", required=True)
@click.option("--contrast", required=True)
def main(brightness, contrast):
    current_brightness = ddcutil.get_current_brightness()
    current_contrast = ddcutil.get_current_contrast()
    monitor_data = MonitorData(brightness=current_brightness, contrast=current_contrast)
    fs.save_to_file(f"{STATE_DIR}/monitor_data.json", json.dumps(monitor_data.__dict__))
    ddcutil.set_brightness(brightness)
    ddcutil.set_contrast(contrast)


if __name__ == "__main__":
    main()
