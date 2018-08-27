start mysql

【各个表】

[ 用户表user ]

　　购买商品的用户信息。

[ 订单表 ]

　　用户所创建的订单　　

[ 订单明细表 ]

　　订单的详细信息，即购买商品的信息

[ 商品表 ]

　　商品的具体信息

【有关系的表之间的业务关系】

分析表与表之间的业务关系时，需要建立在某个业务意义的基础之上去分析。

[ user 与 orders ]

user ---> orders ：一个用户可以创建多个订单， 一对多

orders ---> user ：一个订单只能由一个用户创建，一对一

[ orders与orderdetail ]

orders ---> orderdetail ：一个订单可以包括多个订单明细。（一个订单可以购买多个商品，每个商品的购买信息存在orderdetail信息），一对多

orderdetail ---> orders ：一个订单明细只能包含在一个订单之中，一对一

[ orderdetail 与 items]

orderdetail ---> items ：一个订单明细只对应一个商品信息，一对一

items ---> orderdetail ：一个商品可以包含多个订单明细，一对多

【 没关系的表之间的业务关系】

[orders 与 items]

orders 和 items 之间可以通过orderdetail表建立关系