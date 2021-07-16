1. 程式內容: 

* 將r1-r4暫存器分別存入不同的數值，再計算r0 = r1*r2 + r3*r4。

//=====================================
指令介紹:

mov s1 #n : 

將數值n存到s1暫存器內。 

mul s1 s2 s3 :

將s2和s3暫存器的值相乘存到s1暫存器，需要注意的是存入的暫存器不能是相乘動作下第一個指定的暫存器。

ADD s1 s2 s3

將s2和s3暫存器的值相加存到s1暫存器。
//======================================

2. 如何編譯程式: 

* 輸入指令arm-none-eabi-gcc -g -O0 hw2.s –o \ hw2.exe。

//======================================
錯誤訊息:

collect2.exe: error: ld returned 1 exit status

解決方式:

加入 --specs 參數。
//======================================


3. 程式執行環境: 

*windows powershell。

//======================================
powershell環境配置流程
1. 下載arm-toolchain for windows。
2. 將vim和arm相關工具用new-alias做更名，方便以後使用(不用使用絕對路徑)。
3. 下載arm-none-eabi-insight。

ref: https://l.facebook.com/l.php?u=http%3A%2F%2Fwww.wowotech.net%2Fsoft%2Fvim_in_powershell.html%3Ffbclid%3DIwAR3opSSHMybSFLdU224nqVtqeFkEtKOfHVsS8PxLnO1LH0BICynfJ0uqz4s&h=AT0WcibpPwrqzideERQfBqaBV02TGX6n0GkUF79sD-DDm6x-zXaEdSZNfZSPDhHBl1KqCqaRQWnCbhoGWK21fLDPh80PKaPlb7RlcvJ-j2VmpDKYNIsnQveFPpbplaRPUwiDCA
//======================================


4. 觀察暫存器數值變化:

* arm-none-eabi-insight，設定適當斷點(breakpoint)以後，可逐行執行查看regiter內值得變化。

