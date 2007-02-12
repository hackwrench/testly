'#--
'# Copyright (c) 2006-2007 Luis Lavena, Multimedia systems
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

#include once "testly.bi"
#include once "testly-internals.bi"

namespace Test_Suites
    sub test_suite_exist()
        assert_true(suite_defined("Test_Suites"))
    end sub
    
    sub test_suite_properties()
        with *select_suite("Test_Suites")
            assert_equal("Test_Suites", .suite_name)
            assert_equal(0, .setup_func)
            assert_equal(0, .teardown_func)
            assert_equal(5, .tests_count)
        end with
    end sub
    
    sub test_has_test()
        with *select_suite("Test_Suites")
            assert_true(test_defined("test_has_test"))
            assert_true(test_defined("test_current_test"))
            assert_false(test_defined("test_unknown"))
        end with
    end sub
    
    sub test_current_suite()
        assert_equal("Test_Suites", current_suite_name())
    end sub
    
    sub test_current_test()
        assert_equal("test_current_test", current_test_name())
    end sub
    
    sub register() constructor
        add_suite("Test_Suites")
        add_test("test_suite_exist", @test_suite_exist)
        add_test("test_suite_properties", @test_suite_properties)
        add_test("test_has_test", @test_has_test)
        add_test("test_current_suite", @test_current_suite)
        add_test("test_current_test", @test_current_test)
    end sub
end namespace