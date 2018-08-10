## 说明

个人电脑上直接用switchproxyomega配合$$即可，然而某些软件，如google backup & sync就需要
系统层面配置代理，考虑到家里其他人也有需要访问gg/ytb/tw的需求，但地址并不多，这样的话，
还是考虑在路由器层面就进行break the wall。

## 主要原理
1、在软路由上跑unbound，对于某些域名，使用8.8.8.8进行解析
2、用bgp.he.net来对主流被x掉的服务商用到的bgp as进行路由提取，然后在openvpn连上后将路由
   指过去
3、路由器分配的dns地址及网关都指定为软路由

这样家里就可以随意上这些x掉的网站了

## Future
或许我已经肉身跑路，那么这些都没用了
或者慢慢我已经采集了很多域名及路由，这样的话，switchomega估计也慢慢不用了

## 其他
直接openvpn到境外不太理想，这方面我用了kcptun来做了一层包装，从而使得性能相对比较好。

BTW，软路由并不low，dpdk+vpp性能比一般的家用路由器不知道强到哪里去了，毕竟cpu核可以100%
的跑，多大点事，又不会把家烧了不是。

## TODO
我自己的stateless tcp(sltcp)的方案，目前还暂没有上的必要，主要是够用了。

后续有精立直接在软路由上跑的vpp高性能转发上打通与境外节点的sltcp隧道，这样的话可以在
vpp里直接写入这些路由。
