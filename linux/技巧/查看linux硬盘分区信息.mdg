## df

root@jay-WORK-PC:/home/jay# df

文件系统          1K-块    已用     可用 已用% 挂载点

/dev/sda5      20510716 5881748 13564000   31% /

udev            2009008      12  2008996    1% /dev

tmpfs            809240     892   808348    1% /run

none               5120       0     5120    0% /run/lock

none            2023100      80  2023020    1% /run/shm

/dev/sda7      12720672 8645756  3405684   72% /home



## Fdisk -l

root@jay-WORK-PC:/home/jay# fdisk -l



Disk /dev/sda: 500.1 GB, 500107862016 bytes

255 heads, 63 sectors/track, 60801 cylinders, total 976773168 sectors

Units = 扇区 of 1 * 512 = 512 bytes

Sector size (logical/physical): 512 bytes / 512 bytes

I/O size (minimum/optimal): 512 bytes / 512 bytes

Disk identifier: 0xf0b1ebb0



   设备 启动      起点          终点     块数   Id  系统

/dev/sda1   *          63    78140159    39070048+   7  HPFS/NTFS/exFAT

/dev/sda2        78143486   976768064   449312289+   f  W95 扩展 (LBA)

/dev/sda5        78143488   120086847    20971680   83  Linux

/dev/sda6       120088576   128477183     4194304   82  Linux 交换 / Solaris

/dev/sda7       128479232   154593279    13057024   83  Linux

/dev/sda8       154593558   429931529   137668986    b  W95 FAT32

/dev/sda9       429931593   703373894   136721151    b  W95 FAT32

/dev/sda10      703373958   976768064   136697053+   b  W95 FAT32



## Mount

mkdir /mnt/D

mount -o iocharset=utf8 /dev/sda8 /mnt/D

mount -o iocharset=utf8 /dev/sda9 /mnt/E

mount -o iocharset=utf8 /dev/sda10 /mnt/F

