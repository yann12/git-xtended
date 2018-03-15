#!/usr/bin/env bash

# @test
# Example :
# test_1="hello"
# test_2="bonjour"
# test_3=""
# gbw_implode ', ' 'a' 'b' "$test_1" 3 "$test_2" 4 "$test_3" 5
# a, b, hello, 3, bonjour, 4, 5
function gbw_implode {
    local glue="$1"
    local current_glue=""
    shift

    local -a pieces="($*)"
    local implode=""

    for p in "${pieces[@]}"
    do
        p="$(gbw_trim "$p")"

        if [[ "$implode" == "" ]]; then
            [[ "$p" != "" ]] && implode="$p"
        else
            [[ "$p" != "" ]] && implode="$implode$glue$p"
        fi
    done

    echo "$implode"
}

function gbw_is_bash_interactive {
    [[ $- == *i* ]] \
        && echo "true" \
        || echo "false"
}

# -bash: $'\r': command not found
function gbw_remove_r {
    local file=$1
    sed -i 's/\r$//' $file
}


# TODO : create test
function gbw_trim {
    local string=$1
    echo "$string" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'
}

# TODO : create test
function gbw_regex_remove_colors {
    echo "$1" | sed -E 's/\\e\[[0-9]{1,2}m//g'
}

# TODO : create test
function gbw_echo_fixed_width {
    local e="$GBW_PARAMS_OFF"
    local width middle_char start end
    local start_no_style end_no_style
    local middle_prefix middle_suffix
    local middle trucate count

    if [ "$1" == "-e" ]; then
        e="$GBW_PARAMS_ON"
        shift
    fi

    width="$1"
    middle_char="$2"
    start="$3"
    end="$4"
    [ "$5" != "" ] && middle_prefix="$5"
    [ "$6" != "" ] && middle_suffix="$6"

    if [ "$e" == "$GBW_PARAMS_ON" ]; then
        start_no_style=$(gbw_regex_remove_colors "$start")
        end_no_style=$(gbw_regex_remove_colors "$end")
    else
        start_no_style="$start"
        end_no_style="$end"
    fi

    printf -v generator '%*s' "$width"
    middle=${generator// /$middle_char}

    count=${#start_no_style}+${#end_no_style}+${#middle_prefix}+${#middle_suffix}
    trucate="$middle_prefix${middle:$count}$middle_suffix"

    if [ "$e" == "$GBW_PARAMS_ON" ]; then
        echo -e "$start$trucate$end"
        return
    fi

    echo "$start$trucate$end"
}

# TODO : create test
function gbw_line_generator {
    local length=$1
    local symbol=$2
    printf -v generator '%*s' "$length"

    echo ${generator// /$symbol}
}