---
author: rogeryoungh
date: 2021 年 06 月 20 日
...

# PTA 数组 E

PTA 数组 Easy 部分，[PDF](../PTA数组E.pdf)。

这次的问题都比较简单。

## 7-1 密码强度

```cpp
ll f[10];
char s[100];

int main() {
    scanf("%s", s + 1);
    ll len = strlen(s + 1);
    for (ll i = 1; i <= len; i++) {
        char c = s[i];
        if (c >= '0' && c <= '9') {
            f[1]++;
        } else if (c >= 'a' && c <= 'z') {
            f[2]++;
        } else if (c >= 'A' && c <= 'Z') {
            f[3]++;
        }
    }
    ll x = (f[1] > 0) + (f[2] > 0) + (f[3] > 0) + (len > 8);
    printf("%lld", x);
    return 0;
}
```

## 7-2 统计不同数字字符出现次数

```cpp
ll f[20];
char s[500];

int main() {
    gets(s);
    ll len = strlen(s);
    for (ll i = 0; i <= len - 1; i++) {
        char c = s[i];
        if (c >= '0' && c <= '9') {
            f[c - '0']++;
        }
    }
    ll flag = 0;
    for (ll i = 0; i <= 9; i++) {
        if (f[i] > 0) {
            flag = 1;
            printf("%lld-%lld\n", i, f[i]);
        }
    }
    if (!flag) {
        printf("None!\n");
    }
    return 0;
}
```

## 7-3 最多的字母

```cpp
ll f[50];
char s[100];

int main() {
    scanf("%s", s);
    ll len = strlen(s);
    memset(f, 0, sizeof(f));
    for (ll i = 0; i <= len - 1; i++) {
        ll c = s[i];
        if (c >= 'a' && c <= 'z') {
            f[c - 'a']++;
        }
    }
    ll maxi = 0;
    for (ll i = 0; i <= 25; i++) {
        if (f[i] > f[maxi]) {
            maxi = i;
        }
    }
    printf("%c,%lld\n", maxi + 'a', f[maxi]);
    return 0;
}
```

## 7-4 成绩统计分析表(*)

```cpp
ll ae[10];

void printline(double d) {
    ll ld = d + 0.5;
    printf("%5.1lf ", d);
    _fora (i, 1, ld)
        putchar('*');
    putchar('\n');
}

void prline2(double d) {
    ll ld = d + 0.5;
    printf("%5.1lf%% ", d);
    _fora (i, 1, ld)
        putchar('*');
    putchar('\n');
}

int main() {
    ll n = rr();
    double max = 0, min = 101, sum = 0;
    for (ll i = 1; i <= n; i++) {
        double t;
        scanf("%lf", &t);
        ll lt = (ll)t;
        printf("%03lld: ", i);
        printline(t);

        max = t > max ? t : max;
        min = t < min ? t : min;
        sum += t;
        lt = lt / 10 - 5;
        if (lt < 0)
            lt = 0;
        ae[lt]++;
    }
    putchar('\n');

    printf("Max: ");
    printline(max);
    printf("Min: ");
    printline(min);
    printf("Avg: ");
    printline(sum / n);
    putchar('\n');

    printf("A: ");
    prline2((ae[4] + ae[5]) * 100.0 / n);
    printf("B: ");
    prline2(ae[3] * 100.0 / n);
    printf("C: ");
    prline2(ae[2] * 100.0 / n);
    printf("D: ");
    prline2(ae[1] * 100.0 / n);
    printf("E: ");
    prline2(ae[0] * 100.0 / n);
    return 0;
}
```

## 7-5 找鞍点

```cpp
ll max_x[10], max_y[10];
ll mtx[5][5];

int main() {
    for (ll i = 0; i <= 3; i++)
        for (ll j = 0; j <= 3; j++)
            mtx[i][j] = rr();

    for (ll i = 0; i <= 3; i++) {
        ll my = 0, mx = 0;
        _fora (j, 0, 3) {
            if (mtx[i][j] > mtx[i][my])
                my = j;
            if (mtx[j][i] < mtx[mx][i])
                mx = j;
        }
        max_x[i] = mx;
        max_y[i] = my;
    }
    ll flag = 0;
    for (ll i = 0; i <= 3; i++) {
        for (ll j = 0; j <= 3; j++) {
            if (max_x[j] == i && max_y[i] == j) {
                flag++;
                printf("a[%lld][%lld]=%lld\n", i, j, mtx[i][j]);
            }
        }
    }
    if (!flag) {
        printf("It is not exist!\n");
    }
    return 0;
}
```

## 7-6 折半查找

```cpp
ll nn[100086];

ll lower_bound(ll l, ll r, ll val) {
    while (l < r) {
        ll mid = (l + r) >> 1;
        if (nn[mid] >= val)
            r = mid;
        else
            l = mid + 1;
    }
    return l;
}

int main() {
    ll n = rr();
    for (ll i = 1; i <= n; i++)
        nn[i] = rr();
    ll t = rr();
    ll i = lower_bound(1, n, t);
    if (nn[i] == t)
        printf("It's position is %lld!\n", i);
    else
        printf("No data!\n");
    return 0;
}
```

## 7-7 字符串转换为整数

```cpp
ll read() {
    ll s = 0;
    int c;
    while ((c = getchar()) != EOF) {
        if (c >= '0' && c <= '9')
            s = s * 10 + c - '0';
    }
    return s;
}

int main() {
    printf("%lld", read());
    return 0;
}
```

## 7-8 去掉多余空格

```cpp
char s[1000086];

int main() {
    gets(s);
    ll len = strlen(s);
    if (len > 30) {
        s[30] = 0;
        len = 30;
    }
    printf("[%s]\n", s);
    ll l, r;
    for (ll i = 0; i <= len - 1; i++) {
        if (s[i] != ' ') {
            l = i;
            break;
        }
    }
    for (ll i = len - 1; i >= 0; i--) {
        if (s[i] != ' ') {
            r = i;
            break;
        }
    }
    s[r + 1] = 0;
    printf("[%s]\n", s + l);
    return 0;
}
```

## 7-9 矩阵对角线求和

为什么要把矩阵存下来才计算呢？

```cpp
int main() {
    ll n = rr();
    ll sum = rr();
    for (ll i = 1; i <= n - 1; i++) {
        for (ll j = 1; j <= n; j++)
            rr();
        sum += rr();
    }
    printf("%lld\n", sum);
    return 0;
}
```

## 7-10 倒置字符串并输出

```cpp
char s[1000086];

int main() {
    gets(s);
    ll len = strlen(s) - 1;
    for (ll i = len; i >= 0; i--)
        putchar(s[i]);
    putchar('\n');
    putchar(s[len]);
    return 0;
}
```

## 7-11 去掉最大值和最小值

```cpp
int main() {
    ll sum = 0;
    ll min = 101, max = 0;
    for (int i = 1; i <= 10; i++) {
        ll t = rr();
        max = max < t ? t : max;
        min = min > t ? t : min;
        sum += t;
    }
    ll score = sum - min - max;
    printf("%lld", score);
    return 0;
}
```

## 7-12 有重复的数据

```cpp
ll nn[100086];

void quick_sort(ll *nn, ll l, ll r) {
    if (l >= r)
        return;
    int i = l, j = r;
    int x = nn[(l + r) / 2];
    while (i <= j) {
        while (nn[j] > x)
            j--;
        while (nn[i] < x)
            i++;
        if (i <= j) {
            ll t = nn[i];
            nn[i] = nn[j];
            nn[j] = t;
            i++;
            j--;
        }
    }
    quick_sort(nn, l, j);
    quick_sort(nn, i, r);
}

int main() {
    ll n = rr();
    memset(nn, 0, sizeof(nn));
    _fora (i, 1, n) { nn[i] = rr(); }
    quick_sort(nn, 1, n);
    int flag = 0;
    for (ll i = 2; i <= n; i++)
        flag += nn[i] == nn[i - 1];
    if (flag)
        printf("YES");
    else
        printf("NO");
    return 0;
}
```

## 7-13 判断题

```cpp
ll f[100], ans[100];

int main() {
    ll n = rr(), m = rr();
    for (ll i = 1; i <= m; i++) {
        f[i] = rr();
    }
    for (ll i = 1; i <= m; i++) {
        ans[i] = rr();
    }
    for (ll i = 1; i <= n; i++) {
        ll sum = 0;
        for (ll j = 1; j <= m; j++) {
            if (rr() == ans[j])
                sum += f[j];
        }
        printf("%lld\n", sum);
    }
    return 0;
}
```

## 7-14 统计单词数

```cpp
int isAlpha(int x) {
    if ('A' <= x && x <= 'Z')
        return 1;
    else if ('a' <= x && x <= 'z')
        return 1;
    return 0;
}

char s[1000086];

int main() {
    gets(s);
    int len = strlen(s);
    int p = isAlpha(s[0]);
    int sum = 0;
    for (int i = 1; i <= len; i++) {
        int t = isAlpha(s[i]);
        if (p && !t)
            sum++;
        p = t;
    }
    printf("%d", sum);
    return 0;
}
```

## 7-15 删除某字符

```cpp
char s[1000086];

int main() {
    gets(s);
    char t;
    scanf("%c", &t);
    ll len = strlen(s) - 1;
    for (ll i = 0; i <= len; i++) {
        if (s[i] != t)
            putchar(s[i]);
    }
    return 0;
}
```

## 7-16 自守数

为什么要老老实实算呢，直接打表输出。

```cpp
ll nn[] = {
    0,       1,       5,        6,        25,        76,
    376,     625,     9376,     90625,    109376,    890625,
    2890625, 7109376, 12890625, 87109376, 212890625, 787109376,
};

ll lower_bound(ll l, ll r, ll val) {
    while (l < r) {
        ll mid = (l + r) >> 1;
        if (nn[mid] > val)
            r = mid;
        else
            l = mid + 1;
    }
    return l;
}

int main() {
    ll n = rr();
    for (ll i = 1; i <= n; i++) {
        if (i != 1)
            putchar(' ');
        printf("%lld", lower_bound(0, 17, rr()));
    }
    return 0;
}
```
