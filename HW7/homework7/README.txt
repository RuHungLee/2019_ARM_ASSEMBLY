SIMD簡介
計算機處理訊息時常常碰到非32-bit的資料，如果我們用32-bit微處理器操作它們，會浪費掉很多剩餘的空間。arm基於這個事實，
提供了一些能夠做平行運算的SIMD指令集。以UADD8 R0,R1,R2為例，這個指令將兩組4個8bit data包裝成兩組32 bit data，接
著再將這兩組data平行的做4個加法運送。
SIMD的實現通常要基於programmer和compiler共同負責。作業七需要我們做一個簡單加速實驗，實驗利用了c++定義的類和方法，
任務是算出每一行和其他行的dot product總和。

這次實驗有幾個比較需要注意的地方。

第一，資料的對齊。

使用__attribute__((aligned(16)))來對齊資料，如果沒有對齊不能使用SIMD計算;

第二，C++要實現SIMD使用到的類和方法。

類和方法的使用我參考了c++ and linux compiler的文件。
用到了__m128類指針和 _mm_mul_ps 方法。

第三，實驗時間的評測方法。

時間評測辦法參考了以下這篇blog。我簡單的使用了time來計算，但正確來說，使用clock應該會有比較高的精度。
https://blog.gtwang.org/programming/measure-the-execution-time-in-c-language/

實驗結果:
|              | real  | user  | sys   | 
| ------------ | ----- | ----- | ----- | 
| 一般         | 0.288 | 0.284 | 0.004 | 
| 簡單使用SIMD | 0.238 | 0.238 | 0.000 |





