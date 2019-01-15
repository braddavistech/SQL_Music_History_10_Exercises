-- 1. Query all of the entries in the Genre table
select * from genre;

-- 2. Using the INSERT statement, add one of your favorite artists to the Artist table.
insert into Artist
values (null, "Government Mule", 1977)

-- 3. Using the INSERT statement, add one, or more, albums by your artist to the Album table.
insert into Album
select null, "Southern Traditions", 1977, 832, "RCA", artist.artistid, genre.genreid
from artist, genre
where artist.ArtistName = "Government Mule"
and genre.label = "Rock"

insert into Album
select null, "Family Roots", 1986, 777, "RCA", artist.artistid, genre.genreid
from artist, genre
where artist.ArtistName = "Government Mule"
and genre.label = "Rock"

-- 4. Using the INSERT statement, add some songs that are on that album to the Song table.
insert into Song
select null, "Swamp Music", 322, 1985, genre.genreid, artist.ArtistId, album.AlbumId
from album, artist, genre
where artist.ArtistName = "Government Mule"
and genre.label = "Rock"
and album.title = "Family Roots"

insert into Song
select null, "Simple Times", 356, 1986, genre.genreid, artist.ArtistId, album.AlbumId
from album, artist, genre
where artist.ArtistName = "Government Mule"
and genre.label = "Rock"
and album.title = "Family Roots"

insert into Song
select null, "This Old Flag", 412, 1986, genre.genreid, artist.ArtistId, album.AlbumId
from album, artist, genre
where artist.ArtistName = "Government Mule"
and genre.label = "Rock"
and album.title = "Family Roots"

-- 5. Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
select a.*, b.artistname as "Artist Name", c.title as "Album Title"
from song a
left join
artist b
on a.artistid = b.artistid
left join
album c
on a.albumid = c.albumId
where b.artistname = "Government Mule"

-- 6. Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
select count() as "Number of Songs", album.title as "Album Name"
from song
join album
on album.Albumid = song.AlbumId
group by album.AlbumId

-- 7. Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
select count() as "Number of Songs", artist.artistname "Artist Name"
from song
join artist
on artist.artistid = song.artistid
group by artist.artistid

-- 8. Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
select count() as "Number of Songs", genre.label as "Genre Type"
from song
join genre
on genre.GenreId = song.genreid
group by genre.genreid

-- 9. Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
select  album.title as "Album Name", max(album.albumlength) as "Album Length"
from album

-- 10. Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
select song.title as "Song Name", max(song.songlength) as "Song Length"
from song

-- 11. Modify the previous query to also display the title of the album.
select  song.title as "Song Title", max(song.songlength) as "Song Length", album.title as "Album"
from song
join album
on song.albumid
where song.albumid = album.albumid