# Changelog for `open-browser`

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to the
[Haskell Package Versioning Policy](https://pvp.haskell.org/).

## Unreleased

* Add `CHANGELOG.md` and `README.md`.
* Add `stack.yaml` and `stack.yaml.lock` to package description.
* Example executable renamed `open-browser-example` (from `example`).
* The building of the example executable now requires Cabal flag `example`
  (default: false).

## 0.2.1.0 - 2016-01-05

* As released by rightfold on Hackage. This entry and prior change log is
  reconstructed.
* Support GHC versions before GHC 8.0.
* Add support for 32-bit Windows.

## 0.2.0.0 - 2015-07-31

* Remote deprecated `Network.Browser.openBrowser`.

## 0.1.4.0 - 2015-07-30

* On Linux, silence `xdg-open`.

## 0.1.3.0 - 2015-07-27

* Add support for BSD and Windows.

## 0.1.2.0 - 2015-07-27

* `Web.Browser.openBrowser` added and `Network.Browser.openBrowser` deprecated.

## 0.1.1.0 - 2015-07-27

* Add support for Linux.

## 0.1.0.0 - 2015-07-25

* Initial version. Only OS X supported.
