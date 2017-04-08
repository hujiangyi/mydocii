下列软件包有未满足的依赖关系：  
 vim : 依赖: vim-common (= 2:7.3.429-2ubuntu2.1) 但是 2:7.3.547-4ubuntu1 正要被安装  
E: 无法修正错误，因为您要求某些软件包保持现状，就是它们破坏了软件包间的依赖关系

原因可能是安装vim所依赖的vim-common和系统自带的vim-common版本冲突，解决办法就是先把vim-common卸载了人然后再安装vim即可.

sudo apt-get remove vim-common

sudo apt-get install vim





    
    
    下列软件包有未满足的依赖关系：  
    
     openssh-server : 依赖: openssh-client (= 1:6.6p1-2ubuntu1)  
    
    E: 无法修正错误，因为您要求某些软件包保持现状，就是它们破坏了软件包间的依赖关系。  
    
    这是因为,openssh-server是依赖于openssh-clien的,那ubuntu不是自带了openssh-client吗?原由是自带的openssh-clien与所要安装的openssh-server所依赖的版本不同,这里所依赖的版本是  
    
      
    
    1  
    
    1:6.6p1-2ubuntu1  
    
    所以要安装对应版本的openssh-clien,来覆盖掉ubuntu自带的
    
    
    apt-get install openssh-client=1:6.6p1-2ubuntu1



