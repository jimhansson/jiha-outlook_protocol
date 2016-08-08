# == Class: outlook_protocol
#
# Will setup a new url protocol named outlook:
# this could be used to make links to specific item in outlook, for that you need to find
# the item id that every outlook item has. this can be found by getting the EntryID from
# the outlook object in VB script. this id is changed if the object is moved from server
# to local storage so don't do that! in you script or get the id after the move. 
#
# TODO: small VB script that gives you the id in a dialogbox or clipboard.  
  
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
class outlook_protocol($path = "C:\\Program Files\\Microsoft Office 15\\root\\office15\\") {
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
      data => "${path}\\OUTLOOK.EXE";
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
