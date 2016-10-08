defmodule Itunes.LibraryTest do
  use ExUnit.Case
  doctest Itunes.Library

  @valid_xml """
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>Major Version</key><integer>1</integer>
      <key>Minor Version</key><integer>1</integer>
      <key>Application Version</key><string>12.5.1.21</string>
      <key>Date</key><date>2016-10-08T16:24:36Z</date>
      <key>Features</key><integer>5</integer>
      <key>Library Persistent ID</key><string>94F463D4E31BA10A</string>
      <key>Tracks</key>
      <dict>
        <key>2391</key>
        <dict>
          <key>Track ID</key><integer>2391</integer>
          <key>Size</key><integer>8506710</integer>
          <key>Total Time</key><integer>211382</integer>
          <key>Track Number</key><integer>1</integer>
          <key>Track Count</key><integer>11</integer>
          <key>Year</key><integer>2013</integer>
          <key>Date Modified</key><date>2014-06-08T18:25:31Z</date>
          <key>Date Added</key><date>2014-06-08T18:25:55Z</date>
          <key>Bit Rate</key><integer>320</integer>
          <key>Sample Rate</key><integer>44100</integer>
          <key>Play Count</key><integer>12</integer>
          <key>Play Date</key><integer>3534668376</integer>
          <key>Play Date UTC</key><date>2016-01-03T09:19:36Z</date>
          <key>Artwork Count</key><integer>1</integer>
          <key>Persistent ID</key><string>A64BE42065C995DF</string>
          <key>Track Type</key><string>File</string>
          <key>File Folder Count</key><integer>5</integer>
          <key>Library Folder Count</key><integer>1</integer>
          <key>Name</key><string>Best Of Friends</string>
          <key>Artist</key><string>Palma Violets</string>
          <key>Album</key><string>180</string>
          <key>Genre</key><string>Indie Rock</string>
          <key>Kind</key><string>Аудиофайл MPEG</string>
          <key>Location</key><string>file:///Users/miros/Music/iTunes/iTunes%20Media/Music/Palma%20Violets/180/01%20Best%20Of%20Friends.mp3</string>
        </dict>
        <key>2393</key>
        <dict>
          <key>Track ID</key><integer>2393</integer>
          <key>Size</key><integer>7623781</integer>
          <key>Total Time</key><integer>189309</integer>
          <key>Track Number</key><integer>2</integer>
          <key>Track Count</key><integer>11</integer>
          <key>Year</key><integer>2013</integer>
          <key>Date Modified</key><date>2014-06-08T18:25:28Z</date>
          <key>Date Added</key><date>2014-06-08T18:25:55Z</date>
          <key>Bit Rate</key><integer>320</integer>
          <key>Sample Rate</key><integer>44100</integer>
          <key>Play Count</key><integer>10</integer>
          <key>Play Date</key><integer>3534668564</integer>
          <key>Play Date UTC</key><date>2016-01-03T09:22:44Z</date>
          <key>Artwork Count</key><integer>1</integer>
          <key>Persistent ID</key><string>A295580080B5CDDF</string>
          <key>Track Type</key><string>File</string>
          <key>File Folder Count</key><integer>5</integer>
          <key>Library Folder Count</key><integer>1</integer>
          <key>Name</key><string>Step Up For The Cool Cats</string>
          <key>Artist</key><string>Palma Violets</string>
          <key>Album</key><string>180</string>
          <key>Genre</key><string>Indie Rock</string>
          <key>Kind</key><string>Аудиофайл MPEG</string>
          <key>Location</key><string>file:///Users/miros/Music/iTunes/iTunes%20Media/Music/Palma%20Violets/180/02%20Step%20Up%20For%20The%20Cool%20Cats.mp3</string>
        </dict>
      </dict>
    </dict>
    </plist>
  """

  test "parse_xml parses valid xml itunes library file" do
    result = Itunes.Library.parse_xml(@valid_xml)
    IO.inspect(result)

    assert {:ok, _} = result
  end
end
