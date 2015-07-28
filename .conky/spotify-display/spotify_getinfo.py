#!/usr/bin/python

# Source : http://moxew.deviantart.com/art/Conky-Spotify-Display-383799444

# My part here was to delete all bash part, et manage artist like "motorhead"
# or whatever have a special symbol in his name, or in the album title.

import dbus
import os
import unicodedata
from os.path import expanduser
import urllib

bus = dbus.SessionBus()
player = bus.get_object('com.spotify.qt', '/')
iface = dbus.Interface(player, 'org.freedesktop.MediaPlayer2')
info = iface.GetMetadata()

def perfect_length(str):
	if len(str) > 56:
		return str[:54] + '...'
	else:
		return str

# OUT: [dbus.String(u'xesam:album'), dbus.String(u'xesam:title'), dbus.String(u'xesam:trackNumber'), dbus.String(u'xesam:artist'), dbus.String(u'xesam:discNumber'), dbus.String(u'mpris:trackid'), dbus.String(u'mpris:length'), dbus.String(u'mpris:artUrl'), dbus.String(u'xesam:autoRating'), dbus.String(u'xesam:contentCreated'), dbus.String(u'xesam:url')]
playing_song = info['xesam:title'].encode('utf-8').strip()
playing_artist = info['xesam:artist'][0].encode('utf-8').strip()
playing_album = info['xesam:album'].encode('utf-8').strip()

print(perfect_length(playing_song) + "\n${color orange}" + perfect_length("by${color1} " + playing_artist) + "\n${color orange}" + perfect_length("from ${color1}" + playing_album))

fstored_album = open(os.getenv('HOME') + '/.conky/spotify-display/stored_album.txt', 'r')
stored_album = fstored_album.readline().strip('\n')
fstored_album.close()

if playing_album != stored_album:
	album  = unicodedata.normalize('NFKD', u""+info['xesam:album']).encode('ASCII', 'ignore')
	artist = unicodedata.normalize('NFKD', u""+info['xesam:artist'][0]).encode('ASCII', 'ignore')

	spotify_dir = expanduser('~/.conky/spotify-display/')
	os.chdir(spotify_dir)
	urllib.urlretrieve (info['mpris:artUrl'].encode('utf-8').strip(), "latest.jpg")
	stored_album_fic = open("stored_album.txt","w")
	stored_album_fic.write(playing_album)
	stored_album_fic.close()
