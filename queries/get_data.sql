/*
Purpose:
--------
This query retrieves media records from the digiKam SQLite database by joining:
- AlbumRoots
- Albums
- Images
- ImageInformation

It is designed for reporting / export use cases where a stable schema
and predictable date format are required.

Joins:
------
- AlbumRoots.id          = Albums.albumRoot
- Albums.id              = Images.album
- Images.id              = ImageInformation.imageid

All joins are INNER JOINs, meaning only fully-related records
(album + image + metadata) are returned.

Category Mapping:
-----------------
Images.category is an internal digiKam enum (no lookup table exists):

1 = Image
2 = Video
3 = Audio
4 = Other / Unknown

A CASE expression is used to expose a human-readable category name.

Modification Date Handling:
---------------------------
Images.modificationDate is stored as a numeric value in the database.
To keep a consistent and simple date pattern for downstream systems
(e.g. BI tools, CSV exports, partitioning), the value is truncated
using SUBSTR to return only the leftmost 10 characters (yyyy-mm-dd).

This approach:
- Avoids datetime parsing issues
- Ignores time (HH:mm:ss) intentionally
- Preserves a stable daily grain

Assumptions:
------------
- modificationDate is already stored in a date-like or timestamp-derived format
- Time precision is not required
- SQLite is the execution engine (digiKam default)

Notes:
------
- If modificationDate is NULL or not date-formatted, the result will be NULL
- This query does not attempt timestamp conversion or timezone normalization
*/

SELECT
    ar.id               AS albumRootId,
    a.id                AS albumId,

    i.id                AS imageId,
    i.category          AS fileCategory,
    CASE i.category
        WHEN 1 THEN 'Image'
        WHEN 2 THEN 'Video'
        WHEN 3 THEN 'Audio'
        WHEN 4 THEN 'Other'
        ELSE 'Unknown'
    END                 AS fileCategoryName,

    i.fileSize,

    -- Extract yyyy-mm-dd only (time intentionally discarded)
    substr(
        i.modificationDate,
        1,
        10
    )                   AS modificationDate,

    ii.format
FROM AlbumRoots ar
INNER JOIN Albums a
    ON a.albumRoot = ar.id
INNER JOIN Images i
    ON i.album = a.id
INNER JOIN ImageInformation ii
    ON ii.imageid = i.id;
