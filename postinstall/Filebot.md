# Filebot rename queries

Movies:

```shell script
{n.upperInitial().space(' ')} {'часть '+pi} {audio.language} [{vf}, {(video.bitrate[0].toFloat()/1000).round()}kbps] [{y}, {imdbid}, {certification}, {rating}]
```

Series:

```shell script
{n.upperInitial()}/[{s00e00}] - {t} {audio.language} [{vf}, {(video.bitrate[0].toFloat()/1000).round()}kbps] [{y}, {imdbid}, {certification}, {rating}]
```
