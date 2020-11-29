## Picard rename query
```php
$replace($rreplace(
$if($eq(%albumartist%,Various Artists),
        [Various Artists],
	$left($if2(%albumartistsort%,%artistsort%),1)/$left($rreplace($if2(%albumartistsort%,%artistsort%),; [^\)]+,), 60))
/
$if(%date%,[$left(%date%,4)] )$left($replace(%album%,/,), 70)
$if($gt(%totaldiscs%,1),$if(%discnumber%, \(Disc %discnumber%\),),)
/
$num(%tracknumber%,2). $left(%title%,120),[:?"_]+,),  , )
```
