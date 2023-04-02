# Filebot rename queries

Newer versios of Filebot have decent default naming strategy:

```java
{ jellyfin.id }
{ emby.id }
{ kodi.id }
{ plex.id }
```

[Additional info](https://www.filebot.net/forums/viewtopic.php?t=4116):

* ~ ... nullify the Movies / TV Shows category folder level
* % ... append values to the file name (but before the part index and subtitle language suffix)
* \* ... append values to the movie / series folder name
* \** ... append values to both the file name and the movie / series folder name
* \<< ... append values to the season folder name
* \>> ... inject subcategory folder level after the category folder level (but before the movie / series folder level)
* ^ ... replace subtitle language suffix
* id ... add {id-123} tags to the movie name / movie folder name / series folder name

## Custom

Movies:

```shell script
{n.upperInitial().space(' ')} {'часть '+pi} {audio.language} [{vf}, {(video.bitrate[0].toFloat()/1000).round()}kbps] [{y}, {imdbid}, {certification}, {rating}]
```

Series:

```shell script
{n.upperInitial()}/[{s00e00}] - {t} {audio.language} [{vf}, {(video.bitrate[0].toFloat()/1000).round()}kbps] [{y}, {imdbid}, {certification}, {rating}]
```
