# 期中
### 第一章 看過老師的打法知道文法後 看著網路上的電路圖 自己打出來
### 第二章 alu部分看完圖和解說跟著別人程式碼打出來
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
  
### 第三章根據網路上的圖片和 https://nand2tetris-hdl.github.io/#pc 所寫出

### 第四章參考 [https://ehehe.cn/2021/01/28/Nand2Tetris-Project-4/](https://www.youtube.com/watch?v=q0JfmAZCDVs&t=873s) 和 https://hackmd.io/@4txgOiKNTo23AF4JfVTXKg/H1E-3vwbt#Multasm-amp-Fillasm
### 第五章參考 https://yizhe87.medium.com/from-nand-to-tetris-nand2tetris-project-5-7846812a8dae 和 https://zhuanlan.zhihu.com/p/343850636

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

