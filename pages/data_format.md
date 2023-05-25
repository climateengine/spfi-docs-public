# API Data Formats

## GeoJSON

[GeoJSON](geojson.org) is a format for encoding a variety of geographic data structures.
It is based on JSON (JavaScript Object Notation), which is a lightweight data-interchange format that is easy
for humans to read and write and easy for machines to parse and generate.

A GeoJSON data structure contains a collection of features, each of which has a geometry
(such as a point, line, or polygon) and properties (such as name, population, or area).

If a GeoJSON has multiple features, then the JSON object must start with a single object with property,
`type`, set to `FeatureCollection`.

Here's an example of a simple GeoJSON FeatureCollection that contains a single point location:

```json
{
    "type": "FeatureCollection",
    "features": [
        {
            "type": "Feature",
            "geometry": {
                "type": "Point",
                "coordinates": [102.0, 0.5]
            },
            "properties": {
                "name": "Dinagat Islands"
            }
        }
    ]
}
```

This GeoJSON object contains a single feature, which is a point located at coordinates \[102.0, 0.5\]. The point has a single property, "name", which is set to "Dinagat Islands".
You can use various GIS software and libraries to read, write and display GeoJSON files.

- GeoJSON coordinates are in \[longitude, latitude\] order
- GeoJSON is always in WGS84 projection

### Useful Tools

Typically, GeoJSON objects are created using a tool or library.
Most GIS tools including ArcGIS and QGIS have built-in support for GeoJSON.

**Web Based:**

- [geojson.io](geojson.io) is a helpful website for creating and reading GeoJSON.
- [geojsonlint.com](geojsonlint.com) can validate GeoJSON files.

**Python Based:**

- [python-geojson](https://python-geojson.readthedocs.io/en/latest/) can read and write GeoJSON format.
- [GeoPandas](https://geopandas.org/en/stable/) can operate with geospatial data within a Pandas dataframe.
- [Folium](https://python-visualization.github.io/folium/) can create interactive maps from GeoJSON data.

## Date Specification

Many API endpoints can take an optional date or date range to filter results.
Dates or (`datetime`) can be expressed using an [RFC 3339](https://tools.ietf.org/html/rfc3339)
timestamp, or a simple date string (see below).

### Timezones

If timezones or UTC offsets are given, they will be converted to
a UTC timestamp before processing (all data is in UTC).
Times given without a timezone are assumed to represent UTC
timestamps.

### Date Range

You may represent a date range using a `"/"` separated string.
For open-ended ranges, use `".."` e.g. `"2020-01-01:00:00:00Z/.."`.

### Simple Dates

If using a simple date string, the datetime can be specified in
`YYYY-mm-dd` format, optionally truncating
to `YYYY-mm` or just `YYYY`. Simple date strings will be expanded to
include the entire time period, for example:

- `2017` expands to `2017-01-01T00:00:00Z/2017-12-31T23:59:59Z`
- `2017-06` expands to `2017-06-01T00:00:00Z/2017-06-30T23:59:59Z`
- `2017-06-10` expands to `2017-06-10T00:00:00Z/2017-06-10T23:59:59Z`

If used in a range, the end of the range expands to the end of that
day/month/year, for example:

- `2017/2018` expands to
  `2017-01-01T00:00:00Z/2018-12-31T23:59:59Z`
- `2017-06/2017-07` expands to
  `2017-06-01T00:00:00Z/2017-07-31T23:59:59Z`
- `2017-06-10/2017-06-11` expands to
  `2017-06-10T00:00:00Z/2017-06-11T23:59:59Z`
