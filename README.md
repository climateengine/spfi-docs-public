![SpatiaFi_small.png](images/SpatiaFi_small.png)

# SpatiaFi Public Documentation

This repository contains the public documentation for SpatiaFi.
Feel free to use notebooks, scripts, and other resources in this repository to help you get started with SpatiaFi.

**Note for SpatiaFi developers:** This repository is automatically incorporated into the private docs
repo [spfi-docs-build](https://github.com/climateengine/spfi-docs-build) and deployed to [docs.spatiafi.com](https://docs.spatiafi.com)

## Getting Started

### SpatiaFi API

The SpatiaFi API is a RESTful API that allows you to query and download data from the SpatiaFi database.
The API is available at [api.spatiafi.com](https://api.spatiafi.com).

### Authentication

Authentication is OAuth2. Because it is standardized, most languages will have an authentication library that should be used instead of manual interaction.
For Python, we recommend the library [Authlib](https://docs.authlib.org/en/latest/).

### Data Format

In most cases the SpatiaFi API returns data in [GeoJSON](https://geojson.org/) format.
GeoJSON is a standard format for representing geospatial data.
It is a text-based format that is easy to read and write.
GeoJSON is supported by most GIS software and libraries.

## Contributing

We welcome contributions to this repository.
If you have a suggestion for a new notebook, script, or other resource, please open an issue or submit a pull request.

All contributions must be made under the [MIT License](LICENSE).

### Notebook Guidelines

Jupyter Notebooks in this repository **must not have any cell outputs**.
This is because the notebooks are run automatically as part of the build process, to ensure that they are up-to-date and error-free.
Outputs should be stripped out before committing notebooks to the repository. This can be done with the following command:

```bash
nbstripout notebooks/*.ipynb
```

Alternatively, you can use the pre-commit hook described below.

### nbdime

While not required, we recommend installing [nbdime](https://nbdime.readthedocs.io/en/latest/) to help with notebook diffs.
Then enable nbdime for git:

```bash
nbdime config-git --enable --global
```

### Pre-Commit Hooks

We use [pre-commit](https://pre-commit.com/) to run code formatting and linting before commits are made.
This ensures that all code in the repository is formatted consistently.

Please install pre-commit before making any commits:

```
pip install pre-commit
pre-commit install
```

Jupyter Notebooks must pass the following pre-commit hooks:

- `nbstripout` - Remove notebook outputs before committing
- `black` - Python code formatter
- `isort` - Python import sorter
- `ruff` - Python linter and formatter
- `mdformat` - Markdown linter

## License

This repository is licensed under the [MIT License](LICENSE).
You are free to use the resources in this repository as starting points for your own projects.

## Contact

If you have any questions, please contact us at [support@spatiafi.com](mailto:support@spatiafi.com).
