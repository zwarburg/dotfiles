RESTORE='\033[0m'

RED='\033[00;31m'
GREEN='\033[00;32m'
YELLOW='\033[00;33m'
BLUE='\033[00;36m'
PURPLE='\033[00;35m'
WHITE='\033[97m'

function print_red()
{
	echo -e "${RED}$1${RESTORE}"
}
function print_blue()
{
	echo -e "${BLUE}$1${RESTORE}"
}
function print_yellow()
{
	echo -e "${YELLOW}$1${RESTORE}"
}
function print_purple()
{
	echo -e "${PURPLE}$1${RESTORE}"
}
function print_white()
{
	echo -e "${WHITE}$1${RESTORE}"
}