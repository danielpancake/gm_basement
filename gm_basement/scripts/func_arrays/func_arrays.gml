/*
 * Macros by YellowAfterLife
 * See https://yal.cc/gamemaker-argument_array/
 */
#macro argument_array          __argument_array
#macro argument_index          __argument_index
#macro argument_make_array var __argument_array = array_create(argument_count); for (var __argument_index = 0; __argument_index < argument_count; ++__argument_index) __argument_array[__argument_index]
///
