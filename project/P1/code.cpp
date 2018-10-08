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
