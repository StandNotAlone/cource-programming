---
author: rogeryoungh
date: 2021 年 04 月 13 日
...

# PTA 选择结构 E

PTA 选择结构 EASY 部分，[PDF](./PTA选择E.pdf)。

## 关于代码风格

我的代码风格可能和很多人不同，但只要遵从统一规范的代码都是风格良好的。我比较喜欢大括号放在同一行，因为这样可以一页看更多的代码。

假如不进行格式化，我想你是没有心情看这一串的

```
bool miller_rabbin(int n)
{   int ppp[10] = {2,7,61};
    int a=n-1,b=0,j,v,x;
    if(n<3) return n==2;
    while(1-a&1) a>>=1,++b;
    for(int i=0;i<=2;i++){
    x = ppp[i];
    if(n==x) return true;
    v = power(x,a,n);
    if(v==1||v==n-1) continue;
    for(j=0;j<b;++j) {
    v = v*v%n; if(v==n-1) break; }
    if(j>=b) return false;
    } return true;
}
```

格式化，高亮

```cpp
bool miller_rabbin(int n) {
    if (n < 3)
        return (n == 2);
    int a = n - 1, b = 0;
    while (1 - (a & 1)) {
        a >>= 1;
        ++b;
    }
    int prime[10] = {2, 7, 61};
    for (int i = 0; i <= 2; i++) {
        int x = prime[i];
        if (n == x)
            return true;
        int v = power(x, a, n);
        if (v == 1 || v == n - 1)
            continue;
        int j;
        for (j = 0; j < b; j++) {
            v = v * v % n;
            if (v == n - 1)
                break;
        }
        if (j >= b)
            return false;
    }
    return true;
}
```

良好代码格式能够让程序本身的逻辑一目了然。

除了排版等要求不能太多空白时采取紧凑的代码风格，其他时候尽可能把代码 **展开** 写。

具体的一些建议：

**1 最基本的是好好缩进**

代码是结构性的，良好的缩进可以体现出这种结构。

左大括号的缩进方式，缩进是用 space 还是 tab，这些争论倒无关紧要。风格统一就行。

**2 不要压行，一行只做一件事**

比如 `if` 条件后换行，内层缩进。

```c
if (condition)
    statement;

if (condition) {
    statement;
} else {
    statement;
}
```

`switch` 也是一样，分开写。

```c
switch(condition) {
    case 'A':
        statement;
        break;
}
```

这样，条件是什么，语句是什么，一目了然。

功能不同的代码片段之间空行。

**3 重要的变量见名知意**

比如一堆 `int a,b,c,d,e,f;`，要费很大劲猜这个变量究竟是什么意思，可读性很差。

**4 尽可能延后变量的定义**

尽可能延后变量的定义，尽可能缩小变量的作用域。

在现代的编辑器中，我们可以很方便的查找出该变量在何处定义，定义时有什么注释。定义的上下文一般都是和这个变量有关的信息，有助于我们理解变量的作用。

同样，声明不要全在开头挤着，用到了再定义。

**5 贴代码**

很多时候需要临时的把代码展示出来，比如交流思路时，把代码贴在 QQ 内会显得杂乱无章，截图又不方便调试。

这里建议贴于 [Ubuntu Pastebin](https://paste.ubuntu.com/)，能够提供良好的代码高亮和一定的保存时间，而且不需要登录。

> 将自己的代码格式化再发送是一种礼貌。

## 简单判断

部分题过于简单，不再解释。

### 7-3 春夏秋冬

```c
int main() {
    int n;
    scanf("%d", &n);
    n = n % 100;
    if (n <= 2) {
        printf("winter\n");
    } else if (n <= 5) {
        printf("spring\n");
    } else if (n <= 8) {
        printf("summer\n");
    } else if (n <= 11) {
        printf("autumn\n");
    } else {
        printf("winter\n");
    }
    return 0;
}
```

### 7-4 判断能否被 3，5，7 整除

注意末尾不能有空格，可以通过 `flag` 来判断。

```c
int main() {
    int n;
    scanf("%d", &n);
    int flag = 0;
    if (n % 3 == 0) {
        printf("3");
        flag = 1;
    }
    if (n % 5 == 0) {
        if (flag)
            printf(" ");
        printf("5");
        flag = 1;
    }
    if (n % 7 == 0) {
        if (flag)
            printf(" ");
        printf("7");
        flag = 1;
    }
    if (!flag)
        printf("n");
    return 0;
}
```

### 7-5 有一门课不及格的学生

当低于 $60$ 时 `flag + 1`，只需判断 `flag` 是否恰为 $1$ 。

```c
int main() {
    int a,b;
    scanf("%d %d", &a, &b);
    int flag = 0;
    if (a < 60)
        flag++;
    if (b < 60)
        flag++;
    if (flag == 1)
        printf("1");
    else
        printf("0");
    return 0;
}
```

### 7-6 骑车与走路

设距离为 $x$，则骑车和步行所花的时间分别为

$$\begin{aligned}t_1 &= 27 + x/3 + 23\\t_2&=x/1.2\end{aligned}$$

可以直接据此计算再判断，也可以算出关键点 $x=100$ 再判断。

```c
int main() {
    int n;
    scanf("%d", &n);
    if (n < 100)
        printf("Walk");
    else if(n == 100)
        printf("All");
    else
        printf("Bike");
    return 0;
}
```

### 7-10 于龙加

题目有坑，结果不能以 $0$ 开头。

```c
int main() {
    int a, b;
    scanf("%d %d", &a, &b);
    if (a == 0)
        printf("%d", b);
    else
        printf("%d%d", a, b);
    return 0;
}
```

### 7-13 洛希极限

题目的难点主要在于看不懂，我也帮不了什么（

```c
int main() {
    int type;
    double f1,f2;
    scanf("%lf %d %lf", &f1, &type, &f2);
    if (type == 0) {
        f1 *= 2.455;
    } else {
        f1 *= 1.26;
    }
    printf("%.2lf ", f1);
    if (f1 > f2)
        printf("T_T");
    else
        printf("^_^");
    return 0;
}
```

### 7-14 最简单的 if - else 练习: 乘法还是加法？

```c
int main() {
    double f1,f2;
    scanf("%lf %lf", &f1, &f2);
    int op;
    scanf("%d", &op);
    if (op == 0) {
        printf("%.2lf", f1 + f2);
    } else {
        printf("%.2lf", f1 * f2);
    }
    return 0;
}
```

### 7-21 西安距离

```c
int main() {
    int a, b, c, d;
    scanf("%d %d %d %d", &a, &b, &c, &d);
    printf("%d", abs(a-c) + abs(b-d));
    return 0;
}
```

### 7-24 编程实现两个分数相加

通分，用 gcd 化简。

$$\frac{a}{b}+\frac{c}{d} = \frac{ad+bc}{bd}$$

```c
int gcd(int a, int b) {
    return a ? gcd(b%a, a) : b;
}

int main() {
    int a,b,c,d;
    scanf("%d/%d+%d/%d", &a, &b, &c, &d);
    int e = a*d + b*c;
    int f = b * d;
    int g = gcd(e,f);
    printf("%d/%d+%d/%d=%d/%d", a, b, c, d, e/g, f/g);
    return 0;
}
```

### 7-25 分支结构

题目有坑，非字母无需输出。

```c
int main() {
    char d;
    scanf("%c", &d);
    if ('A' <= d && d <= 'Z') {
        printf("%d\n", d);
    } else if ('a' <= d && d <= 'z') {
        printf("%c\n", d - 32);
    }
    return 0;
}
```

### 7-26 有多少位是7？

取模可以得到末位，除 $10$ 再取模可以得到次末位的数字。因为不超过四位数，反复四次即可。

字符串数组也可以。

```c
int main() {
    int n;
    scanf("%d", &n);
    int ans = 0;
    for (int i = 0; i < 4; i++) {
        if (n % 10 == 7)
            ans++;
        n /= 10;
    }
    printf("%d\n", ans);
    return 0;
}
```

### 7-27 判断体质完整版

```c
int main() {
    double f1, f2;
    scanf("%lf %lf", &f1, &f2);
    double bmi = f1 / f2 / f2;
    if (bmi < 18.5)
        printf("偏瘦");
    else if (bmi < 24)
        printf("正常");
    else if (bmi < 28)
        printf("偏胖");
    else if (bmi < 40)
        printf("肥胖");
    else
        printf("极重度肥胖");
    return 0;
}
```

### 7-29 多分支表达-倍数问题

我想了一会既是 $5$ 的倍数又是 $3$ 的倍数会怎样，没想出来。打算先交一次看看，结果过了。。

```c
int main() {
    int a;
    scanf("%d", &a);
    int f1, f2;
    f1 = f2 = 0;
    if (a % 3 == 0)
        f1 = 1;
    if (a % 5 == 0)
        f2 = 1;
    if (f1 && !f2) {
        printf("%d", a % 5);
    } else if (!f1 && f2) {
        printf("%d", a % 3);
    } else if (!f1 && !f2) {
        printf("%d", a % 15);
    }
    return 0;
}
```

### 7-32 分段计算居民水费

```c
int main() {
    double x;
    scanf("%lf", &x);
    if (x < 0) {
        printf("Input Data error!");
    } else if (x <= 15) {
        printf("%.2lf", 4 * x / 3);
    } else {
        printf("%.2lf", 2.5 * x - 17.5);
    }
    return 0;
}
```

### 7-35 计算分段函数（双分支）

```c
int main() {
    double x;
    scanf("%lf", &x);
    if(x == 0) {
        printf("%.2lf", 0.0);
    } else {
        printf("%.2lf", 1 / x);
    }
    return 0;
}
```

## 最值问题

寻找最值有多种方法，这里介绍一种通用的方法。

关键的，对于数 $a,b$ 取最大值只需

```c
int max(int a, int b) {
    if (a < b)
        return b;
    return a;
}
```

或者简写成三目运算符

```c
return a < b ? b : a;
```

若需要取一个数组的最大值，可以通过反复取 max。

```c
int a[N];
int m = a[0];
for (int i = 0; i < N; i++)
    m = max(a[i], m);
```
### 7-16 找最大数和最小数

```c
int main() {
    int a, b, c;
    scanf("%d %d %d", &a, &b, &c);
    int max = a > b ? a : b;
    max = max > c ? max : c;
    int min = a < b ? a : b;
    min = min < c ? min : c;
    printf("max=%d,min=%d", max, min);
    return 0;
}
```

### 7-31 判断三角形的形状

题目引号没标全，输出应为 `简单三角形`。可以直接判断，也可以像我一样排序后再判断。

若需取中间值，可以把三数求和后再减去最大最小值，剩下的自然是中间值。若数字范围很大，三数求和会溢出，可以用异或。

```c
int main() {
    int a, b, c;
    scanf("%d %d %d", &a, &b, &c);
    int max = a > b ? a : b;
    max = max > c ? max : c;
    int min = a < b ? a : b;
    min = min < c ? min : c;
    int mid = a ^ b ^ c ^ min ^ max;
	// 如果不怕溢出 int ，可以使用加法
    // int mid = a + b + c - min - max;
    if (min + mid <= max)
        printf("NO");
    else if (min == max)
        printf("等边");
    else if (min == mid && min*min + mid*mid == max*max)
        printf("等腰直角");
    else if (min == mid || max == mid)
        printf("等腰");
    else if (min*min + mid*mid == max*max)
        printf("直角");
    else
        printf("普通三角形");
    return 0;
}
```

## 嵌套判断

当分类只需简单的一层时，简单的判断即可。当分类错综复杂时，我们需要谨慎的理清它们的关系。

当一族分类完全的包含于一种分类下时，建议使用 `if` 嵌套，利用层次关系组织我们的程序。倘若摊成一层，不但增大了思考的难度，还增加了出问题的概率。

清晰的代码是最好的注释。

### 7-8 简单计算器

简单分类，注意 `%c` 需要严格对应。

```c
int main() {
    int a,b;
    char op;
    scanf("%d %d %c", &a, &b, &op);
    int ans;
    int flag = 1;
    if (op == '+') {
        printf("%d", a + b);
    } else if (op == '-') {
        printf("%d", a - b);
    } else if (op == '*') {
        printf("%d", a * b);
    } else if (op == '/') {
        if (b == 0)
            printf("Divided by zero!\n");
        else
            printf("%d", a / b);
    } else {
        printf("Invalid operator!\n");
    }
    return 0;
}
```

### 7-20 【分支】【--时制转换A--】

题目描述有误，读入需要加冒号，即 `scanf("%d:%d", &h, &m)` 。

注意细节，$12$ 点的情况需要详细考虑。

```c
int main() {
    int h, m;
    scanf("%d:%d", &h, &m);
    if (h < 12) {
        printf("%02d:%02d AM\n", h, m);
    } else if (h == 12) {
        if (m == 0)
            printf("%02d:%02d AM\n", h, m);
        else
            printf("%02d:%02d PM\n", h, m);
    } else {
        printf("%02d:%02d PM\n", h - 12, m);
    }
    return 0;
}
```


### 7-28 多分支表达-数据奇偶判断

```c
int main() {
    int a, b;
    scanf("%d,%d", &a, &b);
    if (a == 0 || b == 0)
        return 0;
    if (a % 2 == 0) {
        if(b % 2 == 0)
            printf("%d+%d=%d", a, b, a + b);
        else
            printf("%d/%d=%d", a, b, a / b);
    } else {
        if(b % 2 == 0)
            printf("%d*%d=%d", a, b, a * b);
        else
            printf("%d-%d=%d", a, b, a - b);
    }
    return 0;
}
```

## 利用数组

一部分题其实 `if - else` 或 `switch` 都能做，我只是觉得数组更适合。

### 7-17 帮小明出主意

可以 if - else，也可以 switch，我觉得数组比较好。

```c
char s[][20] = {
    "answer = First",
    "answer = Second",
    "answer = Third",
    "answer = Fourth"
};

int main() {
    int a;
    scanf("%d", &a);
    a = a % 4;
    printf("%s", s[a]);
    return 0;
}
```

### 7-23 根据输入的数字，输出需要上课的节数

```c
char s[][80] = {
    "",
    "星期一 8节课",
    "星期二 10节课",
    "星期三 6节课",
    "星期四 8节课",
    "星期五 6节课",
    "今天没有课，可以好好休息一下啦！",
    "今天没有课，可以好好休息一下啦！"
};

int main() {
    int d;
    scanf("%d", &d);
    printf("%s", s[d]);
    return 0;
}
```

### 7-30 输入一个数字，输出其对应的星期几的英文单词

```c
char s[][10] = {
    "",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
};

int main() {
    int a;
    scanf("%d", &a);
    if (1 <= a && a <= 7) {
        printf("%s",s[a]);
    } else {
        printf("输入错误！");
    }
    return 0;
}
```

### 7-33 输出星期名

```c
char s[][10] = {
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
};

int main() {
    int a;
    scanf("%d", &a);
    if (0 <= a && a <= 6) {
        printf("%s", s[a]);
    } else {
        printf("None");
    }
    return 0;
}
```