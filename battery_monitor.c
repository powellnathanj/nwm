#include <err.h>
#include <fcntl.h>
#include <stdio.h>
#include <sys/ioctl.h>
#include <sysexits.h>
#include <unistd.h>

#include <dev/acpica/acpiio.h>

#define  ACPIDEV "/dev/acpi"

static int acpifd;

void
batt_stat()
{
  acpifd = open("/dev/acpi", O_RDONLY);
  
  union acpi_battery_ioctl_arg battio;

  /* This will only work if you have 1 battery */
  battio.unit = 0;

  if (ioctl(acpifd, ACPIIO_BATT_GET_BATTINFO, &battio) == -1)
    err(EX_IOERR, "Getting battery info failed");
  
  printf("Capacity: %d%%\n", battio.battinfo.cap);
}
