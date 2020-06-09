#!/bin/sh
if [ -r $sysconfdir/httpd ]; then
   . $sysconfdir/httpd
fi
exec $sbindir/httpd-scl-wrapper -t
