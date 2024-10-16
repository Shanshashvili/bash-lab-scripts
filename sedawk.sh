#!/bin/bash

# a. Create copy of `passwd` file to `passwd_new`.
cp passwd passwd_new

# b. Change shell for user `saned` from `/usr/sbin/nologin` to `/bin/bash` using AWK
awk -F: 'BEGIN{OFS=":"} $1=="saned" {$7="/bin/bash"} {print}' passwd_new > temp && mv temp passwd_new

# c. Change shell for user `avahi` from `/usr/sbin/nologin` to `/bin/bash` using SED
sed -i 's/^avahi:.*:\/usr\/sbin\/nologin$/avahi:x:115:121:Avahi mDNS daemon,,,:\/var\/run\/avahi-daemon:\/bin\/bash/' passwd_new

# d. Save only 1-st 3-th 5-th 7-th columns of each string based on `:` delimiter 
awk -F: 'BEGIN{OFS=":"} {print $1, $3, $5, $7}' passwd_new > temp && mv temp passwd_new

# e. Remove all lines from file containing word `daemon`
sed -i '/daemon/d' passwd_new

# f. Change shell for all users with **even** `UID` to `/bin/zsh`
awk -F: 'BEGIN{OFS=":"} $2 % 2 == 0 {$4="/bin/zsh"} {print}' passwd_new > temp && mv temp passwd_new

# g. `passwd_new` should not have a new line at the end of the file

truncate -s -1 passwd_new

