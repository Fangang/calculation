//四则运算和简单的逻辑判断系统
//函数以及递归实践
//变量基本运算：++ --
#include <stdio.h> 
#include <stdlib.h> 

int add(int x,int y) 
{
    if(y == 0)
        return x;
    else
        return add(++x,--y); 
}
int sub(int x,int y) 
{
    if(y==0) 
        return x;
    else 
        return sub(--x,--y); 
} 
int mul(int x,int y) 
{
    if(y==0)
        return 0;
    else
        return add(x,mul(x,--y)); //C 语言的递归也可以延迟计算 
} 
int big(int x,int y) 
{
    if(x==0)  //此处必须使用== 
        return 0;
    else if (y==0) 
        return 1;
    else
        return big(--x,--y); 
} 
int small(int x,int y) 
{
    if(x==0) 
        return 1;
    else if(y==0)
        return 0;
    else
        return small(--x,--y); 
} 
int equal(int x,int y) 
{
    if(small(x,y) || big(x,y)) return 0;
    else
        return 1; 
} 
int quo(int x,int y) //求商 
{
    int count=1; 
    if(small(x,y)) return 0;
    else
        return add(count,quo(sub(x,y),y)); 
} 
int remain(int x,int y) //求余
{
    if(small(x,y)) return x;
    else
        return remain(sub(x,y),y); 
} 
int divide(int x,int y)
{
    printf("%d...%d\n",quo(x,y),remain(x,y)); 
} 
int main(int argc,char *argv[]) 
{
    int a=3,b=4,c=7; 
    printf("%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n",add(a,b),sub(a,b),mul(a,b),big(a,b), 
                                      small(a,b),equal(a,b),quo(c,b),remain(c,b));
    divide(c,b); 
    system("pause");
    return 0; 
}


 
