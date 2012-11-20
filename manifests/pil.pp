# Class: django::pil
#
# This module manages PIL requirements package installation
#
# Parameters:
#
# There are no default parameters for this class.
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# This class file is not called directly

class django::pil {

    anchor { 'django::pil::begin': }
    anchor { 'django::pil::end': }

    if !defined(Package['libjpeg'])                   { package {'libjpeg': ensure => installed }}
    if !defined(Package['libjpeg-dev])                { package {'libjpeg-dev': ensure => installed }}
    if !defined(Package['libfreetype6'])              { package {'libfreetype6': ensure => installed }}
    if !defined(Package['libfreetype6-dev'])          { package {'libfreetype6-dev': ensure => installed }}
    if !defined(Package['zlib1g-dev')                 { package {'zlib1g-dev': ensure => installed }}


    exec {'freetype-lnk':
        command => 'ln -s /usr/lib/`uname -i`-linux-gnu/libfreetype.so /usr/lib/',
        requires => [Package['libfreetype6'], Package['libfreetype6-dev']]
    }
    exec {'libjpeg-lnk':
        command => 'ln -s /usr/lib/`uname -i`-linux-gnu/libjpeg.so /usr/lib/',
        requires => [Package['libjpeg-dev'], Package['libjpeg']]
    }
    exec {'zlib-lnk':
        command => 'ln -s /usr/lib/`uname -i`-linux-gnu/libz.so /usr/lib/',
        requires => Package['zlib1g-dev']
    }


}