set -e
set -x

source .misc/env_variables.sh

args=()

if [ "$system_os" == "LINUX" ] ; then
  JUNIT_PATH=$CIRCLE_TEST_REPORTS'/python/tests.xml'
  mkdir $CIRCLE_TEST_REPORTS'/python'
  args+=('--cov' '--cov-fail-under=100' '--doctest-modules' '--junitxml=$JUNIT_PATH')
fi

python3 -m pytest "${args[@]}" 
