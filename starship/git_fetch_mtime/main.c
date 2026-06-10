// clang-format off
#include <stdio.h>
#include <time.h>
#include <sys/stat.h>
#include <sys/types.h>

#if defined(_WIN32) || defined(WIN32)
    #include <sys/utime.h>
    #define STAT _stat
#else
    #include <unistd.h>
    #define STAT stat
#endif
// clang-format on

#define HOUR 3600

void print_result(double diff) {
    long sec = (long)diff;

    if (sec >= 100 * 24 * HOUR) { // 100 days
        fputs("99d+", stdout);
        return;
    }

    long days = sec / (24 * HOUR);
    sec %= (24 * HOUR);

    long hrs = sec / HOUR;
    sec %= HOUR;

    long min = sec / 60;

    if (days == 0 && hrs == 0 && min == 0) {
        fputs("0m", stdout);
    } else {
        // clang-format off
        if (days > 0) printf("%ldd", days);
        if (hrs > 0)  printf("%ldh", hrs);
        if (min > 0)  printf("%ldm", min);
        // clang-format on
    }
}

int main(void) {
    const char *target = ".git/FETCH_HEAD";
    struct STAT st;

    if (STAT(target, &st) != 0) {
        printf("null");
        return 0;
    }

    time_t mtime = st.st_mtime;
    time_t now = time(NULL);
    double diff = difftime(now, mtime);

    print_result(diff);

    return 0;
}
