# outlook_protocol

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with outlook_protocol](#setup)
    * [What outlook_protocol affects](#what-outlook_protocol-affects)
    * [Beginning with outlook_protocol](#beginning-with-outlook_protocol)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Will create a protocol binding for outlook, you can after that use links that start with
outlook:// to link to specific items in outlook like mail or appointments

## Setup

### What outlook_protocol affects

Adds the key "HKEY_CLASSES_ROOT\outlook" to the registry.

## Usage

You may have to supplie the path for where to find the outlook binary. So it might be
simpliest to use it as a class.

class {'outlook_protocol': path => 'path to directory contaning outlook.exe' }

if no path is given it will default to
C:\\Program Files\\Microsoft Office 15\\root\\office15\\

## Reference

## Limitations

only useful on windows

## Development

GitHub is used for issues and code.

## Release Notes/Contributors/Etc **Optional**

### v0.1.0 first version
