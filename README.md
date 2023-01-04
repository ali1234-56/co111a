# 期中
## 第一章 看過老師的打法知道文法後 看著網路上的電路圖 自己打出來
## 第二章 alu部分看完圖和解說跟著別人程式碼打出來
參考資料 https://zhuanlan.zhihu.com/p/346512588
\
\
![](https://scontent.xx.fbcdn.net/v/t1.15752-9/322799872_568903748016119_768592018218217996_n.jpg?stp=dst-jpg_p206x206&_nc_cat=100&ccb=1-7&_nc_sid=aee45a&_nc_ohc=Nu16mG47imoAX-UTUKP&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AdTn57kl0xOXc26iZ5TA0FhhF6uuS-SOfm8U8C8JnEryNg&oe=63DD226E)  
  ` 
  
    //zx
    Mux16(a=x, b=false, sel=zx, out=xOrZeroOut);                    
    //nx
    Not16(in=xOrZeroOut, out=notx);                                 
    Mux16(a=xOrZeroOut, b=notx, sel=nx, out=xOrZeroOrNegatedOut);
    //zy
    Mux16(a=y, b=false, sel=zy, out=yOrZeroOut);                    
    //ny
    Not16(in=yOrZeroOut, out=noty);                                
    Mux16(a=yOrZeroOut, b=noty, sel=ny, out=yOrZeroOrNegatedOut);
    //f
    Add16(a=xOrZeroOrNegatedOut, b=yOrZeroOrNegatedOut, out=xPlusY);
    And16(a=xOrZeroOrNegatedOut, b=yOrZeroOrNegatedOut, out=xAndY);    
    Mux16(a=xAndY, b=xPlusY, sel=f, out=xOpY);
    //no
    Not16(in=xOpY, out=xOpYNot);
    Mux16(a=xOpY, b=xOpYNot, sel=no, out[0..7]=outLSB, out[8..14]=outMSB, out[15]=outMSBbit);
    Mux16(a[0..7]=outLSB, a[8..14]=outMSB, a[15]=outMSBbit, b=true, sel=false, out=out);
    //zr
    Or8Way(in=outLSB, out=xOpYOr1);
    Or8Way(in[0..6]=outMSB, in[7]=outMSBbit, out=xOpYOr2);
    Or(a=xOpYOr1, b=xOpYOr2, out=xOpYOr);
    Not(in=xOpYOr, out=zr);
    //ng
    Or(a=outMSBbit, b=false, out=ng);
    
  `
###  輸入端判斷
判斷 **zx nx zy ny** 的值是否為 0 1 ，所以會使用到像 **if else** 這樣的判斷，所以才**適合用 mux**\
\
f端也同樣如此，1時 輸出 **x+y** ,0時 輸出 **x&y**\
\
no為1時，輸出非out
### 輸出 zr,ng 時，**透過out來判斷**
out 就是計算結果
zr 如果out = 0，就zr = 1，否則zr = 0
ng 如果out < 0，就ng = 1，否則ng = 0
  
## 第三章根據網路上的圖片和 https://nand2tetris-hdl.github.io/#pc 所寫出

## 第四章照著程式打[https://ehehe.cn/2021/01/28/Nand2Tetris-Project-4/](https://www.youtube.com/watch?v=q0JfmAZCDVs&t=873s) 和 https://hackmd.io/@4txgOiKNTo23AF4JfVTXKg/H1E-3vwbt#Multasm-amp-Fillasm 和 https://www.cnblogs.com/YjmStr/p/15371886.html#%E7%AC%AC%E5%9B%9B%E5%91%A8machine-language--%E6%9C%BA%E5%99%A8%E8%AF%AD%E8%A8%80
### 這個單元圍繞在A指令和C指令
* A指令
`@24576`
* C指令
`M=M-1`
* Hack的兩個內存區都是16位寬，15位地址空間。其中指令內存為只讀設備。

* Hack有兩個16為寄存器分別稱為D和A，其支持被算術和邏輯指令顯示操作，如A=D-1，D=!A

* D僅用於存數據，A可以存地址或數據。

* Hack規定內存的存取總是對地址"M"進行操作，如"D=M+1". 而儲存M的內存單元的地址為A中的數值。因此，在對某個內存進行存取操作時，如D=Memory[516]-1，需要先將A中值設為516，然後令D=M-1.

![](https://scontent.xx.fbcdn.net/v/t1.15752-9/323584086_877283143425608_7163540196003113360_n.png?stp=dst-png_s240x240&_nc_cat=105&ccb=1-7&_nc_sid=aee45a&_nc_ohc=SKV7GCs71nsAX99tDyM&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AdRio_Wljebon-uVgKepy4el8S2gAlZkMDZIWu8PDNJVew&oe=63DD3F38)
## 第五章參考 https://yizhe87.medium.com/from-nand-to-tetris-nand2tetris-project-5-7846812a8dae 和 https://zhuanlan.zhihu.com/p/343850636
* ### MEMORY
![](https://pic2.zhimg.com/80/v2-5f812aa44936e308f1dc52a043b88855_720w.webp)
* 存儲器分為三部分，分別為16K的RAM，8K的Screen和1Keyboard，根據他們的地址分配，可以觀察通過高2位就能進行區分
* 訪問16K的RAM，只需要低14位；訪問8K的Screen只需要低13位
為何低幾位不是很了解
* ### CPU抄寫以上連結內容
* ### 最後COMPUTER的想法就是 MEMORY和CPU結合 再加上 ROM32即可
![](https://pic3.zhimg.com/80/v2-93df32cf4ae93c992bbcbb192f6a2096_720w.webp)

#

# 課程：計算機結構 -- 筆記、習題與報告

欄位 | 內容
-----|--------
學期 | 111 學年上學期
學生 |  xxx
學號末兩碼 | xx
教師 | [陳鍾誠](https://www.nqu.edu.tw/educsie/index.php?act=blog&code=list&ids=4)
學校科系 | [金門大學資訊工程系](https://www.nqu.edu.tw/educsie/index.php)
課程教材 | https://gitlab.com/cccnqu111/co

