#include <fcntl.h>
#include <linux/loop.h>
#include <sys/ioctl.h>

int main(int argc, char *argv[])
{
        int lo;
        struct loop_info64 info;

        if (argc != 2)
                return 1;

        lo = open(argv[1], O_RDWR);
        if (ioctl(lo, LOOP_GET_STATUS64, &info))
                return 1;
        info.lo_flags |= LO_FLAGS_PARTSCAN;
        if (ioctl(lo, LOOP_SET_STATUS64, &info))
                return 1;
        return 0;
}
