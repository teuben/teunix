" Vim syntax file
" Language: C++ Additions
" Maintainer: Jon Haggblad <jon@haeggblad.com>
" URL: http://www.haeggblad.com
" Last Change: 12 Oct 2016
" Version: 0.6
" Changelog:
"   0.1 - initial version.
"   0.2 - C++14
"   0.3 - Incorporate lastest changes from Mizuchi/STL-Syntax
"   0.4 - Add template function highlight
"   0.5 - Redo template function highlight to be more robust. Add options.
"   0.6 - more C++14, C++17, library concepts
"
" Additional Vim syntax highlighting for C++ (including C++11/14/17)
"
" This file contains additional syntax highlighting that I use for C++11/14
" development in Vim. Compared to the standard syntax highlighting for C++ it
" adds highlighting of (user defined) functions and the containers and types
" in the standard library / boost.
"
" Based on:
"   http://stackoverflow.com/q/736701
"   http://www.vim.org/scripts/script.php?script_id=4293
"   http://www.vim.org/scripts/script.php?script_id=2224
"   http://www.vim.org/scripts/script.php?script_id=1640
"   http://www.vim.org/scripts/script.php?script_id=3064


" -----------------------------------------------------------------------------
"  Highlight Class and Function names.
"
" Based on the discussion in: http://stackoverflow.com/q/736701
" -----------------------------------------------------------------------------

" Functions
syn match   cCustomParen    "(" contains=cParen contains=cCppParen
syn match   cCustomFunc     "\w\+\s*(\@="
hi def link cCustomFunc  Function

" Class and namespace scope
if exists('g:cpp_class_scope_highlight') && g:cpp_class_scope_highlight
    syn match   cCustomScope    "::"
    syn match   cCustomClass    "\w\+\s*::"
                \ contains=cCustomScope
    hi def link cCustomClass Function
endif

" Template functions.
" Naive implementation that sorta works in most cases. Should correctly
" highlight everything in test/color2.cpp
if exists('g:cpp_experimental_simple_template_highlight') && g:cpp_experimental_simple_template_highlight
    syn region  cCustomAngleBrackets matchgroup=AngleBracketContents start="\v%(<operator\_s*)@<!%(%(\_i|template\_s*)@<=\<[<=]@!|\<@<!\<[[:space:]<=]@!)" end='>' contains=@cppSTLgroup,cppStructure,cType,cCustomClass,cCustomAngleBrackets,cNumbers
    syn match   cCustomBrack    "<\|>" contains=cCustomAngleBrackets
    syn match   cCustomTemplateFunc "\w\+\s*<.*>(\@=" contains=cCustomBrack,cCustomAngleBrackets
    hi def link cCustomTemplateFunc  Function

" Template functions (alternative faster parsing).
" More sophisticated implementation that should be faster but doesn't always
" correctly highlight inside template arguments. Should correctly
" highlight everything in test/color.cpp
elseif exists('g:cpp_experimental_template_highlight') && g:cpp_experimental_template_highlight

    syn match   cCustomAngleBracketStart "<\_[^;()]\{-}>" contained
                \ contains=cCustomAngleBracketStart,cCustomAngleBracketEnd
    hi def link cCustomAngleBracketStart  cCustomAngleBracketContent

    syn match   cCustomAngleBracketEnd ">\_[^<>;()]\{-}>" contained
                \ contains=cCustomAngleBracketEnd
    hi def link cCustomAngleBracketEnd  cCustomAngleBracketContent

    syn match cCustomTemplateFunc "\<\l\w*\s*<\_[^;()]\{-}>(\@="hs=s,he=e-1
                \ contains=cCustomAngleBracketStart
    hi def link cCustomTemplateFunc  cCustomFunc

    syn match    cCustomTemplateClass    "\<\w\+\s*<\_[^;()]\{-}>"
                \ contains=cCustomAngleBracketStart,cCustomTemplateFunc
    hi def link cCustomTemplateClass cCustomClass


    " Remove 'template' from cppStructure and use a custom match
    syn clear cppStructure
    syn keyword cppStructure class typename namespace

    syn match   cCustomTemplate "\<template\>"
    hi def link cCustomTemplate  cppStructure
    syn match   cTemplateDeclare "\<template\_s*<\_[^;()]\{-}>"
                \ contains=cppStructure,cCustomTemplate,cCustomAngleBracketStart

    " Remove 'operator' from cppStructure and use a custom match
    syn clear cppOperator
    syn keyword cppOperator typeid
    syn keyword cppOperator and bitor or xor compl bitand and_eq or_eq xor_eq not not_eq

    syn match   cCustomOperator "\<operator\>"
    hi def link cCustomOperator  cppStructure
    syn match   cTemplateOperatorDeclare "\<operator\_s*<\_[^;()]\{-}>[<>]=\?"
                \ contains=cppOperator,cCustomOperator,cCustomAngleBracketStart
endif

" Alternative syntax that is used in:
"  http://www.vim.org/scripts/script.php?script_id=3064
"syn match cUserFunction "\<\h\w*\>\(\s\|\n\)*("me=e-1 contains=cType,cDelimiter,cDefine
"hi def link cCustomFunc  Function

" Cluster for all the stdlib functions defined below
syn cluster cppSTLgroup     contains=cppSTLfunction,cppSTLfunctional,cppSTLconstant,cppSTLnamespace,cppSTLtype,cppSTLexception,cppSTLiterator,cppSTLiterator_tagcppSTLenumcppSTLioscppSTLcast


" -----------------------------------------------------------------------------
"  Standard library types and functions.
"
" Mainly based on the excellent STL Syntax vim script by
" Mizuchi <ytj000@gmail.com>
"   http://www.vim.org/scripts/script.php?script_id=4293
" which in turn is based on the scripts
"   http://www.vim.org/scripts/script.php?script_id=2224
"   http://www.vim.org/scripts/script.php?script_id=1640
" -----------------------------------------------------------------------------

syntax keyword cppSTLconstant badbit
syntax keyword cppSTLconstant cerr
syntax keyword cppSTLconstant cin
syntax keyword cppSTLconstant clog
syntax keyword cppSTLconstant cout
"syntax keyword cppSTLconstant digits
syntax keyword cppSTLconstant digits10
syntax keyword cppSTLconstant eofbit
syntax keyword cppSTLconstant failbit
syntax keyword cppSTLconstant goodbit
syntax keyword cppSTLconstant has_denorm
syntax keyword cppSTLconstant has_denorm_loss
syntax keyword cppSTLconstant has_infinity
syntax keyword cppSTLconstant has_quiet_NaN
syntax keyword cppSTLconstant has_signaling_NaN
syntax keyword cppSTLconstant is_bounded
syntax keyword cppSTLconstant is_exact
syntax keyword cppSTLconstant is_iec559
syntax keyword cppSTLconstant is_integer
syntax keyword cppSTLconstant is_modulo
syntax keyword cppSTLconstant is_signed
syntax keyword cppSTLconstant is_specialized
syntax keyword cppSTLconstant max_digits10
syntax keyword cppSTLconstant max_exponent
syntax keyword cppSTLconstant max_exponent10
syntax keyword cppSTLconstant min_exponent
syntax keyword cppSTLconstant min_exponent10
syntax keyword cppSTLconstant nothrow
syntax keyword cppSTLconstant npos
syntax keyword cppSTLconstant radix
syntax keyword cppSTLconstant round_style
syntax keyword cppSTLconstant tinyness_before
syntax keyword cppSTLconstant traps
syntax keyword cppSTLconstant wcerr
syntax keyword cppSTLconstant wcin
syntax keyword cppSTLconstant wclog
syntax keyword cppSTLconstant wcout
syntax keyword cppSTLexception bad_alloc
syntax keyword cppSTLexception bad_array_new_length
syntax keyword cppSTLexception bad_exception
syntax keyword cppSTLexception bad_typeid bad_cast
syntax keyword cppSTLexception domain_error
syntax keyword cppSTLexception exception
syntax keyword cppSTLexception invalid_argument
syntax keyword cppSTLexception length_error
syntax keyword cppSTLexception logic_error
syntax keyword cppSTLexception out_of_range
syntax keyword cppSTLexception overflow_error
syntax keyword cppSTLexception range_error
syntax keyword cppSTLexception runtime_error
syntax keyword cppSTLexception underflow_error

syntax keyword cppSTLtype wctrans_t
syntax keyword cppSTLtype wctype_t
syntax keyword cppSTLtype wint_t

syntax keyword cppSTLconstant WEOF
syntax keyword cppSTLconstant WCHAR_MIN
syntax keyword cppSTLconstant WCHAR_MAX


if !exists("cpp_no_cpp11")
    syntax keyword cppSTLconstant nullptr

    " containers (array, vector, list, *map, *set, ...)
    syntax keyword cppSTLtype array
    syntax keyword cppSTLfunction cbegin cend
    syntax keyword cppSTLfunction crbegin crend
    syntax keyword cppSTLfunction shrink_to_fit
    syntax keyword cppSTLfunction emplace
    syntax keyword cppSTLfunction emplace_back
    syntax keyword cppSTLfunction emplace_front
    syntax keyword cppSTLfunction emplace_hint

    " algorithm
    syntax keyword cppSTLfunction all_of any_of none_of
    syntax keyword cppSTLfunction find_if_not
    syntax keyword cppSTLfunction copy_if
    syntax keyword cppSTLfunction copy_n
    syntax keyword cppSTLfunction move
    syntax keyword cppSTLfunction move_backward
    syntax keyword cppSTLfunction shuffle
    syntax keyword cppSTLfunction is_partitioned
    syntax keyword cppSTLfunction partition_copy
    syntax keyword cppSTLfunction partition_point
    syntax keyword cppSTLfunction is_sorted
    syntax keyword cppSTLfunction is_sorted_until
    syntax keyword cppSTLfunction is_heap
    syntax keyword cppSTLfunction is_heap_until
    syntax keyword cppSTLfunction minmax
    syntax keyword cppSTLfunction minmax_element
    syntax keyword cppSTLfunction is_permutation
    syntax keyword cppSTLfunction itoa

    " bitset
    syntax keyword cppSTLfunction to_ullong
    " syntax keyword cppSTLfunction all

    " cinttypes
    syntax keyword cppSTLfunction strtoimax
    syntax keyword cppSTLfunction strtoumax
    syntax keyword cppSTLfunction wcstoimax
    syntax keyword cppSTLfunction wcstoumax

    " chrono
    syntax keyword cppSTLnamespace chrono
    syntax keyword cppSTLcast duration_cast
    syntax keyword cppSTLcast time_point_cast
    syntax keyword cppSTLtype duration
    syntax keyword cppSTLtype system_clock
    syntax keyword cppSTLtype steady_clock
    syntax keyword cppSTLtype high_resolution_clock
    syntax keyword cppSTLtype time_point
    syntax keyword cppSTLtype nanoseconds
    syntax keyword cppSTLtype microseconds
    syntax keyword cppSTLtype milliseconds
    syntax keyword cppSTLtype seconds
    syntax keyword cppSTLtype minutes
    syntax keyword cppSTLtype hours
    syntax keyword cppSTLtype treat_as_floating_point
    syntax keyword cppSTLtype duration_values
    " syntax keyword cppSTLtype rep period
    syntax keyword cppSTLfunction time_since_epoch
    syntax keyword cppSTLfunction to_time_t
    syntax keyword cppSTLfunction from_time_t
    " syntax keyword cppSTLfunction zero
    " syntax keyword cppSTLfunction now

    " complex
    " syntax keyword cppSTLfunction proj

    " condition_variable
    syntax keyword cppSTLtype condition_variable
    syntax keyword cppSTLfunction notify_all
    syntax keyword cppSTLfunction notify_one

    " cstddef
    syntax keyword cppSTLtype nullptr_t max_align_t

    " cstdlib
    syntax keyword cppSTLfunction quick_exit
    syntax keyword cppSTLfunction _Exit
    syntax keyword cppSTLfunction at_quick_exit

    " cuchar
    syntax keyword cppSTLfunction mbrtoc16
    syntax keyword cppSTLfunction c16rtomb
    syntax keyword cppSTLfunction mbrtoc32
    syntax keyword cppSTLfunction c32rtomb

    " exception
    syntax keyword cppSTLtype exception_ptr
    syntax keyword cppSTLtype nested_exception
    syntax keyword cppSTLfunction get_terminate
    syntax keyword cppSTLfunction make_exception_ptr
    syntax keyword cppSTLfunction current_exception
    syntax keyword cppSTLfunction rethrow_exception
    syntax keyword cppSTLfunction throw_with_nested
    syntax keyword cppSTLfunction rethrow_if_nested
    syntax keyword cppSTLfunction rethrow_nested

    " forward_list
    syntax keyword cppSTLtype forward_list
    syntax keyword cppSTLfunction before_begin
    syntax keyword cppSTLfunction cbefore_begin
    syntax keyword cppSTLfunction insert_after
    syntax keyword cppSTLfunction emplace_after
    syntax keyword cppSTLfunction erase_after
    syntax keyword cppSTLfunction splice_after

    " functional
    syntax keyword cppSTLexception bad_function_call
    syntax keyword cppSTLfunctional function
"    syntax keyword cppSTLconstant _1 _2 _3 _4 _5 _6 _7 _8 _9
    syntax keyword cppSTLtype hash
    syntax keyword cppSTLtype is_bind_expression
    syntax keyword cppSTLtype is_placeholder
    syntax keyword cppSTLtype reference_wrapper
    syntax keyword cppSTLfunction bind
    syntax keyword cppSTLfunction mem_fn
    syntax keyword cppSTLfunction ref cref

    " future
    syntax keyword cppSTLtype future
    syntax keyword cppSTLtype packaged_task
    syntax keyword cppSTLtype promise
    syntax keyword cppSTLtype shared_future
    syntax keyword cppSTLenum future_status
    syntax keyword cppSTLenum future_errc
    syntax keyword cppSTLenum launch
    syntax keyword cppSTLexception future_error
    syntax keyword cppSTLfunction get_future
    syntax keyword cppSTLfunction set_value
    syntax keyword cppSTLfunction set_value_at_thread_exit
    syntax keyword cppSTLfunction set_exception
    syntax keyword cppSTLfunction set_exception_at_thread_exit
    syntax keyword cppSTLfunction wait_for
    syntax keyword cppSTLfunction wait_until
    syntax keyword cppSTLfunction future_category
    syntax keyword cppSTLfunction make_error_code
    syntax keyword cppSTLfunction make_error_condition
    syntax keyword cppSTLfunction make_ready_at_thread_exit
    " syntax keyword cppSTLfunction async
    " syntax keyword cppSTLfunction share
    " syntax keyword cppSTLfunction valid
    " syntax keyword cppSTLfunction wait

    " initializer_list
    syntax keyword cppSTLtype initializer_list

    " io
    syntax keyword cppSTLenum io_errc
    syntax keyword cppSTLfunction iostream_category
    syntax keyword cppSTLfunction vscanf vfscanf vsscanf
    syntax keyword cppSTLfunction snprintf vsnprintf
    syntax keyword cppSTLfunction vwscanf vfwscanf vswscanf

    " iterator
    syntax keyword cppSTLiterator move_iterator
    syntax keyword cppSTLfunction make_move_iterator
    syntax keyword cppSTLfunction next prev

    " limits
    syntax keyword cppSTLconstant max_digits10
    syntax keyword cppSTLfunction lowest

    " locale
    syntax keyword cppSTLtype wstring_convert
    syntax keyword cppSTLtype wbuffer_convert
    syntax keyword cppSTLtype codecvt_utf8
    syntax keyword cppSTLtype codecvt_utf16
    syntax keyword cppSTLtype codecvt_utf8_utf16
    syntax keyword cppSTLtype codecvt_mode
    syntax keyword cppSTLfunction isblank
    syntax keyword cppSTLfunction iswblank

    " memory
    syntax keyword cppSTLtype unique_ptr
    syntax keyword cppSTLtype shared_ptr
    syntax keyword cppSTLtype weak_ptr
    syntax keyword cppSTLtype owner_less
    syntax keyword cppSTLtype enable_shared_from_this
    syntax keyword cppSTLtype default_delete
    syntax keyword cppSTLtype allocator_traits
    syntax keyword cppSTLtype allocator_type
    syntax keyword cppSTLtype allocator_arg_t
    syntax keyword cppSTLtype uses_allocator
    syntax keyword cppSTLtype scoped_allocator_adaptor
    syntax keyword cppSTLtype pointer_safety
    syntax keyword cppSTLtype pointer_traits
    syntax keyword cppSTLconstant allocator_arg
    syntax keyword cppSTLexception bad_weak_ptr
    syntax keyword cppSTLcast static_pointer_cast
    syntax keyword cppSTLcast dynamic_pointer_cast
    syntax keyword cppSTLcast const_pointer_cast
    syntax keyword cppSTLfunction make_shared
    syntax keyword cppSTLfunction declare_reachable
    syntax keyword cppSTLfunction undeclare_reachable
    syntax keyword cppSTLfunction declare_no_pointers
    syntax keyword cppSTLfunction undeclare_no_pointers
    syntax keyword cppSTLfunction get_pointer_safety
    syntax keyword cppSTLfunction addressof
    syntax keyword cppSTLfunction allocate_shared
    syntax keyword cppSTLfunction get_deleter
    " syntax keyword cppSTLfunction align

    " mutex
    syntax keyword cppSTLtype mutex
    syntax keyword cppSTLtype timed_mutex
    syntax keyword cppSTLtype recursive_mutex
    syntax keyword cppSTLtype recursive_timed_mutex
    syntax keyword cppSTLtype lock_guard
    syntax keyword cppSTLtype unique_lock
    syntax keyword cppSTLtype defer_lock_t
    syntax keyword cppSTLtype try_to_lock_t
    syntax keyword cppSTLtype adopt_lock_t
    syntax keyword cppSTLtype once_flag
    syntax keyword cppSTLtype condition_variable_any
    syntax keyword cppSTLenum cv_status
    syntax keyword cppSTLconstant defer_lock try_to_lock adopt_lock
    syntax keyword cppSTLfunction try_lock lock unlock try_lock_for try_lock_until
    syntax keyword cppSTLfunction call_once
    syntax keyword cppSTLfunction owns_lock
    syntax keyword cppSTLfunction notify_all_at_thread_exit
"    syntax keyword cppSTLfunction release
    " Note: unique_lock has method 'mutex()', but already set as cppSTLtype
    " syntax keyword cppSTLfunction mutex

    " new
    syntax keyword cppSTLexception bad_array_new_length
    syntax keyword cppSTLfunction get_new_handler

    " numerics, cmath
    syntax keyword cppSTLconstant HUGE_VALF
    syntax keyword cppSTLconstant HUGE_VALL
    syntax keyword cppSTLconstant INFINITY
    syntax keyword cppSTLconstant NAN
    syntax keyword cppSTLconstant math_errhandling
    syntax keyword cppSTLconstant MATH_ERRNO
    syntax keyword cppSTLconstant MATH_ERREXCEPT
    syntax keyword cppSTLconstant FP_NORMAL
    syntax keyword cppSTLconstant FP_SUBNORMAL
    syntax keyword cppSTLconstant FP_ZERO
    syntax keyword cppSTLconstant FP_INFINITY
    syntax keyword cppSTLconstant FP_NAN
    syntax keyword cppSTLconstant FLT_EVAL_METHOD
    syntax keyword cppSTLfunction imaxabs
    syntax keyword cppSTLfunction imaxdiv
    syntax keyword cppSTLfunction remainder
    syntax keyword cppSTLfunction remquo
    syntax keyword cppSTLfunction fma
    syntax keyword cppSTLfunction fmax
    syntax keyword cppSTLfunction fmin
    syntax keyword cppSTLfunction fdim
"    syntax keyword cppSTLfunction nan
    syntax keyword cppSTLfunction nanf
    syntax keyword cppSTLfunction nanl
    syntax keyword cppSTLfunction exp2
    syntax keyword cppSTLfunction expm1
    syntax keyword cppSTLfunction log1p
    syntax keyword cppSTLfunction log2
    syntax keyword cppSTLfunction cbrt
    syntax keyword cppSTLfunction hypot
    syntax keyword cppSTLfunction asinh
    syntax keyword cppSTLfunction acosh
    syntax keyword cppSTLfunction atanh
    syntax keyword cppSTLfunction erf
    syntax keyword cppSTLfunction erfc
    syntax keyword cppSTLfunction lgamma
    syntax keyword cppSTLfunction tgamma
    syntax keyword cppSTLfunction trunc
    syntax keyword cppSTLfunction round
    syntax keyword cppSTLfunction lround
    syntax keyword cppSTLfunction llround
    syntax keyword cppSTLfunction nearbyint
    syntax keyword cppSTLfunction rint
    syntax keyword cppSTLfunction lrint
    syntax keyword cppSTLfunction llrint
    syntax keyword cppSTLfunction scalbn
    syntax keyword cppSTLfunction scalbln
    syntax keyword cppSTLfunction ilogb
    syntax keyword cppSTLfunction logb
    syntax keyword cppSTLfunction nextafter
    syntax keyword cppSTLfunction nexttoward
    syntax keyword cppSTLfunction copysign
    syntax keyword cppSTLfunction fpclassify
    syntax keyword cppSTLfunction isfinite
    syntax keyword cppSTLfunction isinf
    syntax keyword cppSTLfunction isnan
    syntax keyword cppSTLfunction isnormal
    syntax keyword cppSTLfunction signbit

    " random
    syntax keyword cppSTLtype linear_congruential_engine
    syntax keyword cppSTLtype mersenne_twister_engine
    syntax keyword cppSTLtype subtract_with_carry_engine
    syntax keyword cppSTLtype discard_block_engine
    syntax keyword cppSTLtype independent_bits_engine
    syntax keyword cppSTLtype shuffle_order_engine
    syntax keyword cppSTLtype random_device
    syntax keyword cppSTLtype default_random_engine
    syntax keyword cppSTLtype minstd_rand0
    syntax keyword cppSTLtype minstd_rand
    syntax keyword cppSTLtype mt19937
    syntax keyword cppSTLtype mt19937_64
    syntax keyword cppSTLtype ranlux24_base
    syntax keyword cppSTLtype ranlux48_base
    syntax keyword cppSTLtype ranlux24
    syntax keyword cppSTLtype ranlux48
    syntax keyword cppSTLtype knuth_b
    syntax keyword cppSTLtype uniform_int_distribution
    syntax keyword cppSTLtype uniform_real_distribution
    syntax keyword cppSTLtype bernoulli_distribution
    syntax keyword cppSTLtype binomial_distribution
    syntax keyword cppSTLtype negative_binomial_distribution
    syntax keyword cppSTLtype geometric_distribution
    syntax keyword cppSTLtype poisson_distribution
    syntax keyword cppSTLtype exponential_distribution
    syntax keyword cppSTLtype gamma_distribution
    syntax keyword cppSTLtype weibull_distribution
    syntax keyword cppSTLtype extreme_value_distribution
    syntax keyword cppSTLtype normal_distribution
    syntax keyword cppSTLtype lognormal_distribution
    syntax keyword cppSTLtype chi_squared_distribution
    syntax keyword cppSTLtype cauchy_distribution
    syntax keyword cppSTLtype fisher_f_distribution
    syntax keyword cppSTLtype student_t_distribution
    syntax keyword cppSTLtype discrete_distribution
    syntax keyword cppSTLtype piecewise_constant_distribution
    syntax keyword cppSTLtype piecewise_linear_distribution
    syntax keyword cppSTLtype seed_seq
    syntax keyword cppSTLfunction generate_canonical

    " ratio
    syntax keyword cppSTLtype ratio
    syntax keyword cppSTLtype yocto
    syntax keyword cppSTLtype zepto
    syntax keyword cppSTLtype atto
    syntax keyword cppSTLtype femto
    syntax keyword cppSTLtype pico
    syntax keyword cppSTLtype nano
    syntax keyword cppSTLtype micro
    syntax keyword cppSTLtype milli
    syntax keyword cppSTLtype centi
    syntax keyword cppSTLtype deci
    syntax keyword cppSTLtype deca
    syntax keyword cppSTLtype hecto
    syntax keyword cppSTLtype kilo
    syntax keyword cppSTLtype mega
    syntax keyword cppSTLtype giga
    syntax keyword cppSTLtype tera
    syntax keyword cppSTLtype peta
    syntax keyword cppSTLtype exa
    syntax keyword cppSTLtype zetta
    syntax keyword cppSTLtype yotta
    syntax keyword cppSTLtype ratio_add
    syntax keyword cppSTLtype ratio_subtract
    syntax keyword cppSTLtype ratio_multiply
    syntax keyword cppSTLtype ratio_divide
    syntax keyword cppSTLtype ratio_equal
    syntax keyword cppSTLtype ratio_not_equal
    syntax keyword cppSTLtype ratio_less
    syntax keyword cppSTLtype ratio_less_equal
    syntax keyword cppSTLtype ratio_greater
    syntax keyword cppSTLtype ratio_greater_equal

    " regex
    syntax keyword cppSTLtype basic_regex
    syntax keyword cppSTLtype sub_match
    syntax keyword cppSTLtype match_results
    syntax keyword cppSTLtype regex_traits
    syntax keyword cppSTLtype regex_match regex_search regex_replace
    syntax keyword cppSTLiterator regex_iterator
    syntax keyword cppSTLiterator regex_token_iterator
    syntax keyword cppSTLexception regex_error
    syntax keyword cppSTLtype syntax_option_type match_flag_type error_type

    " string
    syntax keyword cppSTLfunction stoi
    syntax keyword cppSTLfunction stol
    syntax keyword cppSTLfunction stoll
    syntax keyword cppSTLfunction stoul
    syntax keyword cppSTLfunction stoull
    syntax keyword cppSTLfunction stof
    syntax keyword cppSTLfunction stod
    syntax keyword cppSTLfunction stold

    " system_error
    syntax keyword cppSTLenum errc
    syntax keyword cppSTLtype system_error
    syntax keyword cppSTLtype error_code
    syntax keyword cppSTLtype error_condition
    syntax keyword cppSTLtype error_category
    syntax keyword cppSTLtype is_error_code_enum
    syntax keyword cppSTLtype is_error_condition_enum
    " syntax keyword cppSTLfunction default_error_condition
    " syntax keyword cppSTLfunction generic_category
    " syntax keyword cppSTLfunction system_category
    " syntax keyword cppSTLfunction code
    " syntax keyword cppSTLfunction category
    " syntax keyword cppSTLfunction message
    " syntax keyword cppSTLfunction equivalent

    " thread
    syntax keyword cppSTLnamespace this_thread
    syntax keyword cppSTLtype thread
    syntax keyword cppSTLfunction get_id
    syntax keyword cppSTLfunction sleep_for
    syntax keyword cppSTLfunction sleep_until
    syntax keyword cppSTLfunction joinable
    syntax keyword cppSTLfunction native_handle
    syntax keyword cppSTLfunction hardware_concurrency
    " syntax keyword cppSTLfunction yield
    " syntax keyword cppSTLfunction join
    " syntax keyword cppSTLfunction detach

    " tuple
    syntax keyword cppSTLtype tuple
    syntax keyword cppSTLtype tuple_size
    syntax keyword cppSTLtype tuple_element
    syntax keyword cppSTLfunction make_tuple
    syntax keyword cppSTLfunction tie
    syntax keyword cppSTLfunction forward_as_tuple
    syntax keyword cppSTLfunction tuple_cat
    " Note: 'ignore' is already set as cppSTLfunction
    " syntax keyword cppSTLconstant ignore

    " typeindex
    syntax keyword cppSTLtype type_index

    " type_traits
    syntax keyword cppSTLtype is_void
    syntax keyword cppSTLtype is_integral
    syntax keyword cppSTLtype is_floating_point
    syntax keyword cppSTLtype is_array
    syntax keyword cppSTLtype is_enum
    syntax keyword cppSTLtype is_union
    syntax keyword cppSTLtype is_class
    syntax keyword cppSTLtype is_function
    syntax keyword cppSTLtype is_pointer
    syntax keyword cppSTLtype is_lvalue_reference
    syntax keyword cppSTLtype is_rvalue_reference
    syntax keyword cppSTLtype is_member_object_pointer
    syntax keyword cppSTLtype is_member_function_pointer
    syntax keyword cppSTLtype is_fundamental
    syntax keyword cppSTLtype is_arithmetic
    syntax keyword cppSTLtype is_scalar
    syntax keyword cppSTLtype is_object
    syntax keyword cppSTLtype is_compound
    syntax keyword cppSTLtype is_reference
    syntax keyword cppSTLtype is_member_pointer
    syntax keyword cppSTLtype is_const
    syntax keyword cppSTLtype is_volatile
    syntax keyword cppSTLtype is_trivial
    syntax keyword cppSTLtype is_trivially_copyable
    syntax keyword cppSTLtype is_standard_layout
    syntax keyword cppSTLtype is_pod
    syntax keyword cppSTLtype is_literal_type
    syntax keyword cppSTLtype is_empty
    syntax keyword cppSTLtype is_polymorphic
    syntax keyword cppSTLtype is_abstract
    syntax keyword cppSTLtype is_signed
    syntax keyword cppSTLtype is_unsigned
    syntax keyword cppSTLtype is_constructible
    syntax keyword cppSTLtype is_trivially_constructible
    syntax keyword cppSTLtype is_nothrow_constructible
    syntax keyword cppSTLtype is_default_constructible
    syntax keyword cppSTLtype is_trivially_default_constructible
    syntax keyword cppSTLtype is_nothrow_default_constructible
    syntax keyword cppSTLtype is_copy_constructible
    syntax keyword cppSTLtype is_trivially_copy_constructible
    syntax keyword cppSTLtype is_nothrow_copy_constructible
    syntax keyword cppSTLtype is_move_constructible
    syntax keyword cppSTLtype is_trivially_move_constructible
    syntax keyword cppSTLtype is_nothrow_move_constructible
    syntax keyword cppSTLtype is_assignable
    syntax keyword cppSTLtype is_trivially_assignable
    syntax keyword cppSTLtype is_nothrow_assignable
    syntax keyword cppSTLtype is_copy_assignable
    syntax keyword cppSTLtype is_trivially_copy_assignable
    syntax keyword cppSTLtype is_nothrow_copy_assignable
    syntax keyword cppSTLtype is_move_assignable
    syntax keyword cppSTLtype is_trivially_move_assignable
    syntax keyword cppSTLtype is_nothrow_move_assignable
    syntax keyword cppSTLtype is_destructible
    syntax keyword cppSTLtype is_trivially_destructible
    syntax keyword cppSTLtype is_nothrow_destructible
    syntax keyword cppSTLtype has_virtual_destructor
    syntax keyword cppSTLtype alignment_of
    syntax keyword cppSTLtype rank
    syntax keyword cppSTLtype extent
    syntax keyword cppSTLtype is_same
    syntax keyword cppSTLtype is_base_of
    syntax keyword cppSTLtype is_convertible
    syntax keyword cppSTLtype remove_cv
    syntax keyword cppSTLtype remove_const
    syntax keyword cppSTLtype remove_volatile
    syntax keyword cppSTLtype add_cv
    syntax keyword cppSTLtype add_const
    syntax keyword cppSTLtype add_volatile
    syntax keyword cppSTLtype remove_reference
    syntax keyword cppSTLtype add_lvalue_reference
    syntax keyword cppSTLtype add_rvalue_reference
    syntax keyword cppSTLtype remove_pointer
    syntax keyword cppSTLtype add_pointer
    syntax keyword cppSTLtype make_signed
    syntax keyword cppSTLtype make_unsigned
    syntax keyword cppSTLtype remove_extent
    syntax keyword cppSTLtype remove_all_extents
    syntax keyword cppSTLtype aligned_storage
    syntax keyword cppSTLtype aligned_union
    syntax keyword cppSTLtype decay
    syntax keyword cppSTLtype enable_if
    syntax keyword cppSTLtype conditional
    syntax keyword cppSTLtype common_type
    syntax keyword cppSTLtype underlying_type
    syntax keyword cppSTLtype result_of
    syntax keyword cppSTLtype integral_constant
    syntax keyword cppSTLtype true_type
    syntax keyword cppSTLtype false_type

    " unordered_map, unordered_set, unordered_multimap, unordered_multiset
    syntax keyword cppSTLtype unordered_map
    syntax keyword cppSTLtype unordered_set
    syntax keyword cppSTLtype unordered_multimap
    syntax keyword cppSTLtype unordered_multiset
    syntax keyword cppSTLtype hasher
    syntax keyword cppSTLtype key_equal
    syntax keyword cppSTLiterator local_iterator
    syntax keyword cppSTLiterator const_local_iterator
    syntax keyword cppSTLfunction bucket_count
    syntax keyword cppSTLfunction max_bucket_count
    syntax keyword cppSTLfunction bucket_size
    syntax keyword cppSTLfunction bucket
    syntax keyword cppSTLfunction load_factor
    syntax keyword cppSTLfunction max_load_factor
    syntax keyword cppSTLfunction rehash
    syntax keyword cppSTLfunction reserve
    syntax keyword cppSTLfunction hash_function
    syntax keyword cppSTLfunction key_eq

    " utility
    syntax keyword cppSTLtype piecewise_construct_t
    syntax keyword cppSTLconstant piecewise_construct
    syntax keyword cppSTLfunction declval
    syntax keyword cppSTLfunction forward
    syntax keyword cppSTLfunction move_if_noexcept

    " raw string literals
    syntax region cppRawString matchgroup=cppRawDelimiter start=@\%(u8\|[uLU]\)\=R"\z([[:alnum:]_{}[\]#<>%:;.?*\+\-/\^&|~!=,"']\{,16}\)(@ end=/)\z1"/ contains=@Spell

    syn match cNumber "0b[01]\+"
endif " C++11


" Default highlighting
if version >= 508 || !exists("did_cpp_syntax_inits")
  if version < 508
    let did_cpp_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink cppSTLbool         Boolean
  HiLink cppStorageClass    StorageClass
  HiLink cppStatement       Statement
  HiLink cppSTLfunction     Function
  HiLink cppSTLfunctional   Typedef
  HiLink cppSTLconstant     Constant
  HiLink cppSTLnamespace    Constant
  HiLink cppSTLtype         Typedef
  HiLink cppSTLexception    Exception
  HiLink cppSTLiterator     Typedef
  HiLink cppSTLiterator_tag Typedef
  HiLink cppSTLenum         Typedef
  HiLink cppSTLios          Function
  HiLink cppSTLcast         Statement " be consistent with official syntax
  HiLink cppRawString       String
  HiLink cppRawDelimiter    Delimiter
  delcommand HiLink
endif
