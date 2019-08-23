<!-- 
title: Leap Year
from: code
create: 2019-08-23
tags: code,term
-->

## Leap Year
- 闰年，四年一闰，百年不闰，四百年再闰
- 公转 365.2422天，4年多出一天，400年会快3.12天
```
#include <stdio.h>
int main()
{
    int year;
    printf("Enter a year: ");
    scanf("%d",&year);
    if(year%4 == 0)
    {
        if( year%100 == 0)
        {
            // year is divisible by 400, hence the year is a leap year
            if ( year%400 == 0)
                printf("%d is a leap year.", year);
            else
                printf("%d is not a leap year.", year);
        }
        else
            printf("%d is a leap year.", year );
    }
    else
        printf("%d is not a leap year.", year);
    
    return 0;
}
```

