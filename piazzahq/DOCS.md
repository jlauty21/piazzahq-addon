# Piazza HQ

A family wall calendar for any screen with a browser: calendars, weather, photos, chores, to-dos, shopping and smart-home widgets, free to use.
This add-on runs the Piazza HQ server inside Home Assistant. The wall display is any browser pointed at it: a TV, a tablet, a Raspberry Pi in kiosk mode, a spare laptop.

> **Experimental.** This add-on is new and has not been run on many Home Assistant installs yet. Please report problems at https://piazzahq.com/contact.

## Install

1. Start the add-on (**Start**), and turn on **Start on boot** and **Watchdog** if you want it to come back by itself.
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

- **Supported hardware:** 64-bit installs only (Home Assistant OS or Supervised on amd64 or aarch64, including a Raspberry Pi 4 or 5 with the 64-bit image). 32-bit Raspberry Pi installs are not supported.
- **Port 3000** is open to your home network. Set an **App PIN** in Piazza HQ (Settings → Security) so that only your family can change things. The wall display itself is always visible to anyone on your network.
- **Home Assistant Container or Core installs** have no add-ons. Use the Docker image instead: https://piazzahq.com/guide.
- **No sidebar panel.** Piazza HQ's pages do not work behind Home Assistant's ingress address, so it opens in its own tab through **Open Web UI**.

More help: https://piazzahq.com/user-guide
