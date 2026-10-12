# Piazza HQ

A family wall calendar for any screen with a browser: calendars, weather, photos, chores, to-dos, shopping and smart-home widgets, free to use.
This add-on runs the Piazza HQ server inside Home Assistant. The wall display is any browser pointed at it: a TV, a tablet, a Raspberry Pi in kiosk mode, a spare laptop.

> **Experimental.** This add-on is new and has not been run on many Home Assistant installs yet. Please report problems at https://piazzahq.com/contact.

## Install

1. Start the add-on (**Start**). The first start downloads the Piazza HQ image, which takes a couple of minutes. Turn on **Start on boot** and **Watchdog** if you want it to come back by itself; Watchdog is off until you switch it on, and it is what makes Home Assistant restart the add-on if it ever stops answering.
2. Click **Open Web UI**. The first time, a short setup wizard asks for your email address to give you a free key, your language, and your location for the weather.
3. Put the wall display on a screen: open `http://<your Home Assistant address>:3000/` in a browser on that screen (for example `http://homeassistant.local:3000/`). That address is the display. The same address plus `/app` is the control app, where you design the layout, and plus `/hub` is the Family Hub for chores, to-dos and shopping on phones.

## Connect Piazza HQ to Home Assistant

Inside the add-on, Home Assistant is reachable at `http://homeassistant:8123`.

1. In Home Assistant, open your profile (bottom left) → **Security** → **Long-lived access tokens** → **Create token**, and copy it.
2. In Piazza HQ: **Settings → Home Assistant**, use `http://homeassistant:8123` as the address and paste the token.

Then the Entity Status, Smart Home Grid and Camera widgets can show your devices. The **Template** box on an Entity Status widget has a built-in wizard for writing Home Assistant templates; the cookbook is at https://piazzahq.com/template-cookbook.

## Your data

Everything (the database, photos and settings) is kept in the add-on's own storage. It is included in Home Assistant backups, survives add-on updates, and is removed only if you uninstall the add-on and choose to delete its data. You can also download a complete backup from Piazza HQ itself (**Settings → Backup**).

## Updating

Update it like any add-on: when a new Piazza HQ release is out, Home Assistant shows an update on the add-on's page. The in-app updater is turned off here on purpose.

## Good to know

- **Supported hardware:** 64-bit installs only: Home Assistant OS or Supervised on amd64 or aarch64. That includes a **Raspberry Pi 3, 4 or 5 running the 64-bit Home Assistant OS image** (on a Pi 3, choose the "Raspberry Pi 3 (64-bit)" image). Home Assistant's older 32-bit images are not supported; reinstall with the 64-bit image and restore your Home Assistant backup.
- **Memory:** Piazza HQ itself is light, about 70 MB when idle (measured on a Raspberry Pi 4; the optional Camera widget adds about 20 MB). Home Assistant is the big one, so a Raspberry Pi 3 with only 1 GB of memory is tight, and a Pi 4 with 2 GB or more is more comfortable.
- **On a Raspberry Pi 3, be patient after a restart.** In our test (Home Assistant Supervised on a Pi 3 with 1 GB of memory) the add-on was back and serving Piazza HQ within about five minutes of a reboot and kept its data, but Home Assistant itself took ten minutes or more to open its own page, and the Pi was using swap the whole time. Nothing was lost; it was just slow. If the Pi will also run Home Assistant for the rest of your home, use a Pi 4 or 5 (or any amd64 machine).
- **The address on the display's setup screen.** Until the add-on is updated to a release that fixes this, the first-run screen on the wall display can show an address that starts with `172.`. That is the add-on's private address inside Home Assistant and phones cannot reach it. Use your Home Assistant address instead: `http://<your Home Assistant address>:3000/app`. Newer releases show the address your browser used, and also have a setting, **Settings → Address people use to reach this**, to type the right address yourself (it is also used for the links in the daily briefing email).
- **Port 3000** is open to your home network. Set an **App PIN** in Piazza HQ (Settings → Security) so that only your family can change things. The wall display itself is always visible to anyone on your network.
- **Home Assistant Container or Core installs** have no add-ons. Use the Docker image instead: https://piazzahq.com/guide.
- **No sidebar panel.** Piazza HQ's pages do not work behind Home Assistant's ingress address, so it opens in its own tab through **Open Web UI**.

More help: https://piazzahq.com/user-guide
