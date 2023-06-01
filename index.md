# 🌐 Introduction

SpatiaFi is a platform that combines geospatial data processing with a REST API.
It's designed to take in a substantial amount of location data and provide climate-related insights
through an accessible API.

Utilizing widely-accepted formats like OpenAPI and JSON, SpatiaFi can easily be
integrated into data processing pipelines, analytics workflows, and content management systems.
The resultant climate insights can be leveraged for informed decision-making in a range of systems and processes.

💡 If you are new to geospaital data, we recommend reading the [Geospatial Data](/geospatial-data) page.

## 📚 About These Docs

This documentation is automatically generated from our
[GitHub repository](https://github.com/climateengine/spfi-docs-public).  There you will find
the source files for these docs, as well as the Juptyer notebooks used to generate the tutorials.
You are welcome to use the notebooks and code snippets in your own projects.

At the top of each page, you will find a link to the source code.

If you find any errors or
omissions, please [open an issue](https://github.com/climateengine/spfi-docs-public/issues/new) or
[submit a pull request](https://github.com/climateengine/spfi-docs-public/pulls), and we will get it fixed. 🔧

## ✨ API Overview

⏱ **If you would like to get started with the API immediately, see the [Quickstart](/quickstart) guide.**

The API is organized into the following sections:

- **Dataset Overview** - These endpoints provide information about the datasets available through the API.
  Metadata provided includes the dataset name, description, and the geographic area covered.
  Here you will also find endpoints for statistics covering the _entire_ dataset. Generally, these endpoints
  cannot be filtered to a specific location or region of interest.
- **Spatial Statistics** - These are the most powerful endpoints provide statistics about a dataset
  for a specific location or region of interest.  For example, you can request the average temperature
  for a specific point, or the average risk of flooding for a specific region. These endpoints are
  capable of returning data for a single point in time, or for a range of dates.
- **Point Values** - These endpoints simplify the process of requesting data for a single point.
- **Crop Dataset** - These endpoints provide image data for a specific location or region of interest.
  Using these endpoints, you can request a map of the average temperature for a specific region.
- **Search** - These endpoints provide a way to search for datasets by name, description, or location.

### Authentication

Authentication is based off of OAuth 2.0. Because it is standardized, most languages will
have an authentication library that should be used instead of manual interaction.
For Python, we recommend the library [Authlib](https://docs.authlib.org/en/latest/).

🔑 **Using the API requires authentication. Test credentials can be obtained by [contacting us](https://spatiafi.com/contact/).**

See the [Authentication tutorial](/tutorials/authentication) for more information, and examples in Python.

### Request Format

A request is generally made up of a geographic location, and a dataset of interest.
Some endpoints accept a latitude and longitude (via `GET`) when requesting data for
a single point, but most endpoints require a GeoJSON object (via `POST`).

After familiarizing yourself with the API, it is
highly recommended to use a library to handle creating the GeoJSON objects and making requests.

### Dataset Format

The data returned by the API is roughly divided into: **datasets** and **timeseries**.

**Datasets** represent data that is collected at or aggregated over a period of time, such as
average temperature or precipitation for a single month. A dataset may be made from a single
point in time, or (more commonly) is the result of aggregation and will have a start and end date.

**Timeseries** represent data that is collected over time, such as temperature or precipitation and is
made up of all **datasets** that fall within a given time period.

Timeseries and dataset endpoints are structured similarly, and can return the same data, but
using the timeseries endpoints is more efficient when requesting data for multiple dates.
