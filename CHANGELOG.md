# Changelog
All notable changes to the gtk-fortran project are documented in this file. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [cairo-fortran dev]

### Added
- Type `cairo_text_extents_t` in `src/cairo-types.f90`.


## [cairo-fortran 1.1.0] 2023-06-02

### Added
- `LICENSE_EXCEPTION`: text of the GCC RUNTIME LIBRARY EXCEPTION 3.1.
- `CHANGELOG.md`
- `logo/`: a logo using Chi and Rho in a purple ellipse. Indeed, the original name of the Cairo library was Xr.

### Changed
- `src/cairo-auto.f90` and `src/cairo-enums.f90` updated for **Cairo 1.17.8** (generated with the `cfwrapper.py` program under Fedora 38).
- `test/test2.f90` is now creating a SVG file.
- `test/test4.f90` is now creating a PDF file.

## [cairo-fortran 1.0.0]

This repository was cloned in 2022 from a backup of the now unavailable @brocolis' repository, using the latest 5th September 2021 version.
