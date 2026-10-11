# Piazza HQ add-ons for Home Assistant

[![Add this repository to your Home Assistant](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fjlauty21%2Fpiazzahq-addon)

**[Piazza HQ](https://piazzahq.com)** is a free family wall calendar for any screen with a browser: calendars, weather, photos, chores, to-dos, shopping, and smart-home widgets that show what Home Assistant knows.

This repository holds the Home Assistant **add-on**, for **Home Assistant OS** and **Home Assistant Supervised** (the two installs that have an add-on store, on 64-bit `amd64` or `aarch64`, including a Raspberry Pi 3, 4 or 5 running the 64-bit Home Assistant OS image; a Pi 3 has only 1 GB of memory, so it is tight). On Home Assistant Container or Core, use the [Docker image](https://piazzahq.com/guide) instead; it is the same software.

## Install

1. In Home Assistant open **Settings → Add-ons → Add-on Store**.
2. Open the **⋮** menu (top right) → **Repositories**, paste `https://github.com/jlauty21/piazzahq-addon` and click **Add**. (Or press the button above.)
3. Find **Piazza HQ** in the store, install it and press **Start**.
4. Press **Open Web UI** and follow the setup wizard.

The add-on's **Documentation** tab explains the rest: putting the wall display on a screen, connecting it to Home Assistant, backups and updates.

## Add-ons

| Add-on | What it does |
| --- | --- |
| [Piazza HQ](piazzahq/) | The Piazza HQ server. The wall display is any browser pointed at it. |

## For the maintainer

- The add-on does not build anything: it pulls `ghcr.io/jlauty21/piazzahq:<version>`, the same image Docker users run. After a **stable** release is out and its image is published, run `bash scripts/set-version.sh x.y.z`, commit and push; Home Assistant then offers the update.
- Betas are never published here.
- The add-on is `stage: experimental` until it has been run on a real Home Assistant OS and a Supervised install.
