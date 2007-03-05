'#--
'# Copyright (c) 2006-2007 Luis Lavena, Multimedia systems
'#
'# This source code is released under the MIT License.
'# See MIT-LICENSE file for details
'#++

#ifndef __TESTLY_SUITE_BI__
#define __TESTLY_SUITE_BI__

#include once "testly.bi"
#include once "testly_list.bi"

namespace Testly
    '# AssertCount is used to store results of the Suite
    type AssertCount
        assertions as uinteger
        failures as uinteger
        errors as uinteger
    end type
    
    '# Suite defines a list of test to be processed
    '# also, it could offer a setup and teardown functionality before and after running the
    '# tests defined.
    '# results (counts) are collected in stats (AssertCount)
    '# this suite can also be excluded from results and failures/errors collecting process
    '# useful for internal testing.
    type Suite
        declare constructor(byref as string = "", byref as suite_func_t = 0, byref as suite_func_t = 0)
        declare destructor()
        
        suite_name as string
        
        setup_func as suite_func_t
        setup_failed as boolean
        
        teardown_func as suite_func_t
        teardown_failed as boolean
        
        declare property tests_count as uinteger
        
        exclude as boolean
        tests_list as List ptr
        stats as AssertCount
    end type
    
end namespace 'Testly

#endif '__TESTLY_SUITE_BI__
