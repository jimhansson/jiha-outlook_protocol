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
# [*path*]
#   The path to the office installation, defaults to
#   "C:\\Program Files\\Microsoft Office 15\\root\\office15\\"
#
# === Variables
#
# === Examples
#
#  class { 'outlook_protocol':
#     path  => "C:\Program Files\Microsoft Office 15\root\office15\",
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
