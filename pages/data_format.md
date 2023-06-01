# Data Formats

Geospatial data is often categorized into two main types: raster and vector.
Raster and vector data can each be represented in a variety of formats, but SpatiaFi
and other GIS systems most commonly
use **GeoJSON for vector data** and **GeoTIFF for raster data**.

### Raster Data

Raster data is essentially a matrix of cells organized into rows and columns where each cell contains a value representing information. It's typically used for continuously changing data, such as elevation, temperature, or imagery. Each cell in the raster grid has a specific value, and the combination of these cells represents the complete image or spatial surface.

In the context of geospatial analysis, raster data can be a digital aerial photograph with pixels as cells, a scanned map, or even a matrix of regularly-spaced observation points. Satellite images and digital elevation models (DEMs) are common examples of geospatial raster data.

### Vector Data

Vector data, on the other hand, is used to represent discrete geographic features using points, lines, and polygons. Each point, line, or polygon represents a specific feature on the Earth's surface, and these features are defined by their coordinates.

- Points: Defined by a single x, y coordinate. Common examples could include the location of a city or a tree.
- Lines: Defined by a set of ordered x, y coordinates. They typically represent linear features such as roads or rivers.
- Polygons: Defined by a set of ordered x, y coordinates where the first and last coordinate are the same, forming a closed shape. They usually represent areas such as country boundaries or a city's limits.

Vector data is often used for features that have clear boundaries or distinct locations, such as buildings, roads, or political boundaries.

In summary, raster and vector are two primary methods to represent geospatial data, each with their strengths. Raster is excellent for representing continuous phenomena and is often used with remotely sensed data, while vector is great for depicting discrete objects with precise boundaries and is often used in GIS applications.

**Important:** SpatiaFi most commonly uses GeoJSON, a vector data format.

## GeoJSON (Vector)

[GeoJSON](geojson.org) is a format for encoding a variety of geographic data structures.
It is based on JSON (JavaScript Object Notation), which is a lightweight data-interchange format that is easy
for humans to read and write and easy for machines to parse and generate.

A GeoJSON data structure contains one or more `Features`, each of which has a geometry
(such as a point, line, or polygon) and properties (such as name, population, or area).

The most common GeoJSON `Feature` types are `Point`, and `Polygon`.
A `Point` is a single coordinate. A `Polygon` is a closed shape with a list of coordinates.

**Important:** GeoJSON coordinates are always in \[longitude, latitude\] order.

### Examples

#### Point

Here is an example of a GeoJSON Point representing the location of a place with latitude 40.7128 and longitude -74.0060:

```json
{
  "type": "Feature",
  "geometry": {
    "type": "Point",
    "coordinates": [-74.0060, 40.7128]
  },
  "properties": {
    "name": "New York"
  }
}

```

In the GeoJSON Point object above, "coordinates" is an array containing the longitude and latitude values.
The "properties" object is optional and can hold any additional information.

#### Polygon

Here is an example of a GeoJSON Polygon representing a simple, square area:

```json
{
  "type": "Feature",
  "geometry": {
    "type": "Polygon",
    "coordinates": [
      [
        [-73.958, 40.8003],
        [-73.9498, 40.7968],
        [-73.9737, 40.7648],
        [-73.9814, 40.7681],
        [-73.958, 40.8003]
      ]
    ]
  },
  "properties": {
    "name": "Central Park"
  }
}
```

In the GeoJSON Polygon object above, "coordinates" is an array of linear ring arrays
(each defining a boundary of the polygon). Each linear ring is an array of points,
with the first and last point being the same to close the polygon.
This example polygon is a simple one with no holes, so there is only one linear ring in the
"coordinates" array. The "properties" object can hold any additional information, similar to the Point example.

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

## GeoTiff (Raster)

GeoTIFF is a powerful public domain metadata standard that allows georeferencing information to be embedded within a TIFF (Tagged Image File Format) file. The primary purpose of GeoTIFF is to include geographic information within an image file, which can be used for various geospatial applications.

As an extension of the TIFF format, a GeoTIFF file can be viewed as a regular image file, displaying the visual content of the file. What makes GeoTIFF unique and useful for geospatial applications, however, is the additional embedded georeferencing metadata. This metadata may include details such as the map projection, coordinate systems, and datum, which aligns the image to its geographical position on the earth's surface.

By using GeoTIFF, geospatial data and images can be shared and seamlessly integrated into Geographic Information System (GIS) platforms, enabling powerful analysis and visualization capabilities. This interoperability makes GeoTIFF a popular choice for many professionals working in fields like cartography, remote sensing, and land surveying, among others.

For example, satellite imagery, aerial photography, and even scanned maps can be saved in the GeoTIFF format, preserving spatial information for use in software systems that support georeferencing. These capabilities have opened up a wide range of possibilities for spatial analysis, data sharing, and map creation.

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
