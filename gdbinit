set history save on
set history size unlimited

# Safe loading for EVER9ONE
add-auto-load-safe-path /home/rzou/

set breakpoint pending on

# Dump to std::cout
define cout
    call (void)operator<<(std::cout, $arg0)
    call (void)std::cout.flush()
    printf "\n"
end

#
# std::vector<>
#

define pvector
  if $argc == 0
    help pvector
  else
    set $size = $arg0._M_impl._M_finish - $arg0._M_impl._M_start
    set $capacity = $arg0._M_impl._M_end_of_storage - $arg0._M_impl._M_start
    set $size_max = $size - 1
  end
  if $argc == 1
    set $i = 0
    while $i < $size
      printf "elem[%u]: ", $i
      p *($arg0._M_impl._M_start + $i)
      set $i++
    end
  end
  if $argc == 2
    set $idx = $arg1
    if $idx < 0 || $idx > $size_max
      printf "idx1, idx2 are not in acceptable range: [0..%u].\n", $size_max
    else
      printf "elem[%u]: ", $idx
      p *($arg0._M_impl._M_start + $idx)
    end
  end
  if $argc == 3
    set $start_idx = $arg1
    set $stop_idx = $arg2
    if $start_idx > $stop_idx
      set $tmp_idx = $start_idx
      set $start_idx = $stop_idx
      set $stop_idx = $tmp_idx
    end
    if $start_idx < 0 || $stop_idx < 0 || $start_idx > $size_max || $stop_idx > $size_max
      printf "idx1, idx2 are not in acceptable range: [0..%u].\n", $size_max
    else
      set $i = $start_idx
    while $i <= $stop_idx
      printf "elem[%u]: ", $i
      p *($arg0._M_impl._M_start + $i)
      set $i++
    end
    end
  end
  if $argc > 0
    printf "Vector size = %u\n", $size
    printf "Vector capacity = %u\n", $capacity
    printf "Element "
    whatis $arg0._M_impl._M_start
  end
end

document pvector
  Prints std::vector<T> information.
  Syntax: pvector <vector> <idx1> <idx2>
  Note: idx, idx1 and idx2 must be in acceptable range [0..<vector>.size()-1].
  Examples:
  pvector v - Prints vector content, size, capacity and T typedef
  pvector v 0 - Prints element[idx] from vector
  pvector v 1 2 - Prints elements in range [idx1..idx2] from vector
end

#
# std::string
#

define pstring
  if $argc == 0
    help pstring
  else
    printf "String \t\t\t= \"%s\"\n", $arg0._M_data()
    printf "String size/length \t= %u\n", $arg0._M_rep()._M_length
    printf "String capacity \t= %u\n", $arg0._M_rep()._M_capacity
    printf "String ref-count \t= %d\n", $arg0._M_rep()._M_refcount
  end
end

document pstring
  Prints std::string information.
  Syntax: pstring <string>
  Example:
  pstring s - Prints content, size/length, capacity and ref-count of string s
end

#
# C++ related beautifiers (optional)
#

set print pretty on
set print object on
set print static-members on
set print vtbl on
set print demangle on
set demangle-style gnu-v3
set print sevenbit-strings off
