#! /bin/sh

# An shunit2 bash unit test - https://tinyurl.com/y3nw7z6g


testListIntersect() {
  # shellcheck disable=SC1091
  . ../includes/useful-functions.sh
  
  _RES=$(_list_intersect 'apple banana' 'banana grapes apple carrot')
  
  assertNotNull 'list_intersect should report non-empty string' "${_RES}"
  assertTrue "Logical negation with union as used in images.sh" "[ -n \"${_RES}\" ] || [[ 0 -ne 0 ]]" 
}


# shellcheck disable=SC1091
. ./shunit2/shunit2