#Ve370  Introduction to Computer Organization

## **Project** **1**

 

##**PROJECT DESCRIPTION**

 

Develop a MIPS assembly program that operates on a data segment consisting of an array of 32-bit unsigned integers. In the text (program) segment of memory, write a procedure called main that implements the main() function and other subroutines described below. Assemble, simulate, and carefully comment the file. Screen print your simulation results and explain the results by annotating the screen prints. You should compose an array whose size is determined by you in the main function and is not less than 20 elements. 

---

开发一个MIPS汇编程序，该程序在由32位无符号整数数组组成的数据段上运行。 在内存的文本（程序）段中，编写一个名为main的过程，该过程实现main（）函数和下面描述的其他子例程。 组装，模拟并仔细评论文件。 屏幕打印模拟结果并通过注释屏幕打印来解释结果。 您应该组成一个数组，其大小由您在main函数中确定，并且不少于20个元素。



> Count specific elements in the integer array A[] whose size is numElements and return the following:
>
> When cntType = 1, count the elements greater than or equal to 60;  
>
> When cntType = -1, count the elements less than 60; 
>
> 计算整数数组A []中的特定元素，其大小为numElements并返回以下内容：
>
> 当cntType = 1时，计算大于或等于60的元素;
>
> 当cntType = -1时，计算小于60的元素;       

```c
main() {
    int size = ...;  //determine the size of the array here
    int PassCnt, FailCnt;
    int testArray[size] = { 55, 83,   
        ... //compose your own array here
                         };
    PassCnt = countArray(testArray, size, 1);
    FailCnt = countArray(testArray, size, -1);
}

int countArray(int A[], int numElements, int cntType) {
/**********************************************************************
* Count specific elements in the integer array A[] whose size is     *
* numElements and return the following:                              *
* When cntType = 1, count the elements greater than or equal to 60;  *
* When cntType = -1, count the elements less than 60;                *
* 计算整数数组 A[] 中的特定元素，其大小为numElements并返回以下内容：
* 当cntType = 1时，计算大于或等于60的元素;
* 当cntType = -1时，计算小于60的元素;  
**********************************************************************/
    int i, cnt = 0;
    for (i=numElements-1; i>-1; i--) {
        switch (cntType) {
                case '1' : cnt += Pass(A[i]); break;
                otherwise: cnt += Fail(A[i]); 
        }
    }
    return cnt;
}

int Pass(int x) {
    if(x>=60) return 1;
    else return 0;
}

int Fail(int x) {
    if (x<60) return 1;
    else return 0;
}

```

 

##**DELIVERABLES**

A written report is required for this project. The entire program must be clearly commented and saved as a .s file, and attached to the project report as an appendix. The report must also contain screen shots and explanations of simulation results. This is an individual assignment. Your work must be submitted electronically to Canvas before the specified due date. 

---

该项目需要书面报告。 整个程序必须明确注释并保存为.s文件，并作为附录附加到项目报告中。 报告还必须包含屏幕截图和模拟结果的说明。 这是个人作业。 您的工作必须在指定的截止日期之前以电子方式提交给Canvas。

 

##**DUE DATE**

The project report is due by **11:59pm, October 11, 2018** 