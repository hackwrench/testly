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

#include once "testly_internals.bi"
#include once "testly_common.bi"

namespace Testly
    namespace InternalHelpers
        dim shared SELECTED_SUITE as Suite ptr
        dim shared SELECTED_TEST as TestCase ptr
        
        '#############################################################
        '# defined and select helpers
        '# these helpers allow internal testing of the library
        '# you could use them directly, but the best approach is use 
        '# the defines
        '# 
        '# suite_defined_helper will return true in suite_name is found
        function suite_defined(byref suite_name as string) as boolean
            dim result as boolean
            dim item as Suite ptr
            
            item = find_suite(SUITES_LIST, suite_name)
            if not (item = 0) then
                result = true
            end if
            
            return result
        end function
        
        
        '# test_defined_helper will return true in test_name is found
        function test_defined(byref test_name as string) as boolean
            dim result as boolean
            dim item as TestCase ptr
            
            '# test_defined works only on the SELECTED_SUITE!!!
            if not (SELECTED_SUITE = 0) then
                item = find_test(SELECTED_SUITE->tests_list, test_name)
                if not (item = 0) then
                    result = true
                endif
            end if
            
            return result
        end function
        
        
        '# select_suite_helper return a pointer to the suite_name structure
        function select_suite(byref suite_name as string) as Suite ptr
            dim result as Suite ptr
            
            result = find_suite(SUITES_LIST, suite_name)
            SELECTED_SUITE = result
            
            return result
        end function
        
        
        '# select_test_helper return a pointer to the test_name structure
        function select_test(byref test_name as string) as TestCase ptr
            dim result as TestCase ptr
            
            result = find_test(SELECTED_SUITE->tests_list, test_name)
            SELECTED_TEST = result
            
            return result
        end function
        
        
        '# current_suite_name_helper return a plain string with the current suite name
        function current_suite_name() as string
            dim result as string
            
            if not (RUNNING_SUITE = 0) then
                result = RUNNING_SUITE->suite_name
            end if
            
            return result
        end function
        
        
        '# current_test_name_helper return a plain string with the current test name
        function current_test_name() as string
            dim result as string
            
            if not (RUNNING_TEST = 0) then
                result = RUNNING_TEST->test_name
            end if
            
            return result
        end function
        
    end namespace 'InternalHelpers
end namespace 'Testly