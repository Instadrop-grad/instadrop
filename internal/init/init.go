package init

import "os"

func init() {
	os.Setenv("TZ", "UTC")
}
