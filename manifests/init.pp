# == Class: outlook_protocol
#
# Full description of class outlook_protocol here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'outlook_protocol':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Jim Hansson <jim.hansson@gmail.com>
#
# === Copyright
#
# Copyright 2015 Jim Hansson, unless otherwise noted.
#
class outlook_protocol($path = 'C:\\Program Files\\Microsoft Office\\Office15\\') {
  registry::value {
    '(OUTLOOK) outlook-rotocol':
      key => 'HKEY_CLASSES_ROOT\outlook',
      value => 'URL Protocol',
      data => '';
    '(OUTLOOK) url-protocol':
      key => 'HKEY_CLASSES_ROOT\outlook',
      value => '(default)',
      data => 'URL:Outlook Folders';
    '(OUTLOOK) icon':
      key => 'HKEY_CLASSES_ROOT\outlook\DefaultIcon',
      value => '(default)',
      data => "C:\\Program Files\\Microsoft Office\\Office15\\OUTLOOK.EXE";
    '(OUTLOOK) open':
      key => 'HKEY_CLASSES_ROOT\outlook\shell',
      value => '(default)',
      data => 'open';
    '(OUTLOOK) command':
      key => 'HKEY_CLASSES_ROOT\outlook\shell\open\command',
      value => '(default)',
      data => "${path}\\OUTLOOK.EXE /select \"%1\"";
  }
}
