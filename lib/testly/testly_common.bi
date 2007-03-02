'#--
'# Copyright (c) 2006-2007 Luis Lavena, Multimedia systems
'#
'# This source code is released under the MIT License.
'#
'# Permission is hereby granted, free of charge, to any person obtaining
'# a copy of this software and associated documentation files (the
'# "Software"), to deal in the Software without restriction, including
'# without limitation the rights to use, copy, modify, merge, publish,
'# distribute, sublicense, and/or sell copies of the Software, and to
'# permit persons to whom the Software is furnished to do so, subject to
'# the following conditions:
'#
'# The above copyright notice and this permission notice shall be
'# included in all copies or substantial portions of the Software.
'#
'# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
'# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
'# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
'# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
'# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
'# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
'# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
'#++

#ifndef __TESTLY_COMMON_BI__
#define __TESTLY_COMMON_BI__

#include once "testly_list.bi"
#include once "testly_case.bi"
#include once "testly_suite.bi"

namespace Testly
    '# FailureLog is used to record the assertion problems (either failures or errors)
    '# in case of errors (as fatal) the is_error flag must be true
    type FailureLog
        suite_name as string
        test_name as string
        filename as string
        linenumber as uinteger
        message as string
        is_error as boolean
    end type
    
    '# library constructors
    declare sub initialize() constructor
    declare sub terminate() destructor
    
    declare function log_failure(byref as string, byref as string, byref as string, _
                    byval as uinteger, byref as string, byval as boolean = false) as boolean
    
    '# custom_assertion is already defined in testly.bi
    
    '# generic find_ functions
    declare function find_suite(byval as List ptr, byref as string) as Suite ptr
    declare function find_test(byval as List ptr, byref as string) as TestCase ptr
    
    '# EXTERNS
    '# SUITE_LIST
    extern SUITES_LIST as List ptr
    
    '# FAILURES/ERROR LIST
    extern FAILURES_LIST as List ptr
    
    '# RUNNING_SUITE
    extern RUNNING_SUITE as Suite ptr
    
    '# RUNNING_TEST
    extern RUNNING_TEST as TestCase ptr
    
end namespace 'Testly

#endif '__TESTLY_COMMON_BI__
