Action

showUpgradeJob

getUpgradeJob                        在menuNew中使用的用于构造任务树

getUpgradeJobList                            在

showAddJob

showDeleteJob

getEntity

getUpgradeEntity

showEntityList

showUpgradeResult

getUpgradeResult

showUpgradeStatusParam

getUpgradeStatusTree



添加一个UpgradeJob                   addUpgradeJob

删除一个UpgradeJob                   deleteUpgradeJob

立即执行一个UpgradeJob                    upgradeAllNow

向UpgradeJob中添加一个entity                 addEntityToJob

删除UpgradeJob中的一个entity                 deleteJobEntity

立即执行一个entity的upgrade                   upgradeNow  upgradeSingleNow





Job 升级任务

Worker 一个entity的升级过程



UpgradeJob只负责Worker生成，并记录Worker的Future



立即执行的直接生成Worker



排错

1、telnet登陆参数

2、Flash太小装不下E型的升级文件，总大小64M mpu 20M E型升级文件38M

3、ftp client指向ip错了

4、升级一个E型要42分钟





Enable Password: ****

fzd-13# show onu-upgrade-record transaction 1

  Transaction ID      : 1

  Slot                : 3

  Onu Type            : cc8800e

  Hw Version          : any

  Upgrade mode        : ctc

  Action              : activate and commit

  Status              : upgraded

  Start Time          : 2017/04/20  23:13:42

  Last Update Time    : 2017/04/20  23:55:22

  File Name           : /tffs0/onuapp/CC8800E-II-V2.3.0.21.bin



  Upgrade status statistics:

  Success: 1        onu(s).

  Failure: 0        onu(s).

  Timeout: 0        onu(s).

  Other  : 0        onu(s).

  Total  : 1        onu(s).

fzd-13#





