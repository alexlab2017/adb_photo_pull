# adb\_photo\_pull [![Codacy Badge](https://api.codacy.com/project/badge/Grade/976d66bf332a47aa9f42ecb7e490707a)](https://www.codacy.com/app/alexlab2017/adb_photo_pull?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=alexlab2017/adb_photo_pull&amp;utm_campaign=Badge_Grade)

Utility to pull the last `n` number of photos from an Android device.

## Requirements

-   An Android device
-   Android Debug Bridge (`adb`) installed
-   `bash`

On Ubuntu installing `adb` should be pretty easy: `sudo apt install android-tools-adb`.
More data on this tool is in the official [documentation](https://developer.android.com/studio/command-line/adb).

## Usage

`adb_photo_pull number`

The only argument is `number` and should be an integer.

Copy `adb_photo_pull.sh` in `/usr/local/bin/` to call it form anywhere.

NOTE: Edit the two variables `photo_dir` and `out_dir` according to your needs.

## Background

With Ubuntu 18.04 came out [Bug #1792085](https://bugs.launchpad.net/ubuntu/+source/gvfs/+bug/1792085). In short `mtp` connection become **very** slow when browsing a folder with lots of files like `DCIM/Camera`.

I do not have any kind of sync for photos enabled on my phone, neither Google Photos or Samsung Sync or similar. Sometimes it happends that I have to take a couple of pictures and put them on my laptop to edit or to hand them to a friend on a USB stick and here comes the pain: `mtp` too slow, `bluetooth` too slow... how to take this photos out of the phone?!?

I found this interesting [article](https://vxlabs.com/2014/11/06/use-adb-to-bypass-dog-slow-mtp-transfer-of-files-from-android-to-linux/) and I decided to give it a try: it really works!

What is a bit annoying is to spawn an `adb shell` to find out the names of the photos to then `adb pull` the desired file.

What I need to do is just something like `adb pull [last n photos]` so I wrote a rough bash script to do so.

## Details

Assumption(s):
-   Filenames of photos are in chronological order

You have to enable `Developer mode` on your phone by tapping multiple times on the `Build Number` (How to get there differs between Android versions, just do a quick search on the Intetnet), then go to `Developer options` and toggle `USB debugging` on. You may find this [article](https://www.pixelspot.net/2017/07/03/adb-file-transfer-best-way-manage-files/) useful.

Connect the phone to your computer with the USB cable and, when prompted (on the phone) allow the connection.

### Security

I never connect my phone to untrusted devices, I charge the phone with _my_ power adapter, **not** at public charge stations where you connect just the USB cable. Enabling USB debuggign may lead to security related issues (i.e. if you lose your phone), keep this in mind.
