如果你想在以太坊ETH上发行一个ERC20的代币，你需要了解ERC20代币合约，通读本文以后，你将获得一个比较厉害的技能，希望你能学会。下图是基于ETH发行的ERC20版的USDT，你可以大概了解一下一个基本的ERC20代币的一些信息：
![输入图片说明](https://images.gitee.com/uploads/images/2020/1015/152946_dae8db8a_8185976.png "iShot2020-10-15下午03.28.36.png")

 **什么是ERC20** 

可以把ERC20简单理解成以太坊上的一个代币协议，所有基于以太坊开发的代币合约都遵守这个协议。遵守这些协议的代币我们可以认为是标准化的代币，而标准化带来的好处是兼容性好。这些标准化的代币可以被各种以太坊钱包支持，用于不同的平台和项目。说白了，你要是想在以太坊上发行代币融资，必须要遵守ERC20标准。

ERC20的标准接口是这样的:

```
contract ERC20 {
      function name() constant returns (string name)
      function symbol() constant returns (string symbol)
      function decimals() constant returns (uint8 decimals)
      function totalSupply() constant returns (uint totalSupply);
      function balanceOf(address _owner) constant returns (uint balance);
      function transfer(address _to, uint _value) returns (bool success);
      function transferFrom(address _from, address _to, uint _value) returns (bool success);
      function approve(address _spender, uint _value) returns (bool success);
      function allowance(address _owner, address _spender) constant returns (uint remaining);
      event Transfer(address indexed _from, address indexed _to, uint _value);
      event Approval(address indexed _owner, address indexed _spender, uint _value);
    }
```

下面对上面的内容做一个简单的解释：

 **name**  
> 返回ERC20代币的名字，例如”My test token”。

 **symbol**  
> 返回代币的简称，例如：MTT，这个也是我们一般在代币交易所看到的名字。

 **decimals**  
> 返回token使用的小数点后几位。比如如果设置为3，就是支持0.001表示。

 **totalSupply**  
> 返回token的总供应量

 **balanceOf**  
> 返回某个地址(账户)的账户余额

 **transfer**  
> 从代币合约的调用者地址上转移_value的数量token到的地址_to，并且必须触发Transfer事件。

 **transferFrom**   
> 从地址_from发送数量为_value的token到地址_to,必须触发Transfer事件。transferFrom方法用于允许合同代理某人转移token。条件是from账户必须经过了approve。这个后面会举例说明。

 **approve**  
> 允许_spender多次取回您的帐户，最高达_value金额。 如果再次调用此函数，它将以_value覆盖当前的余量。

 **allowance**  
> 返回_spender仍然被允许从_owner提取的金额。

后面三个方法不好理解，这里还需要补充说明一下：
approve是授权第三方（比如某个服务合约）从发送者账户转移代币，然后通过 transferFrom() 函数来执行具体的转移操作。

举例说明，如果账户A有1000个ETH，想允许B账户随意调用他的100个ETH，过程如下：

```
1. A账户按照以下形式调用approve函数approve(B,100)  
2. B账户想用这100个ETH中的10个ETH给C账户，调用transferFrom(A, C, 10)  
3. 调用allowance(A, B)可以查看B账户还能够调用A账户多少个token  
```


 **如何发行ERC20代币**  
