<!-- 
title: RSpec Cheat sheet
from: work
create: 2019-08-16
tags: work,ruby,program
-->

## RSpec Cheat Sheet

| rspec  | code  |
|--------|-------|
| == expected  | actual == expected  |
| =~ /expected/  | actual =~ /expected/  |
| be > expected  | actual > expected  |
| be(expected)  | actual.equal? expected  |
| be_a_kind_of(expected)  | actual.instance_of? expected  |
| be_an_instance_of(expected)  | actual.instance_of? expected  |
| be_false  | actual == false or nil  |
| be_true  | actual == true  |
| be_nil  | actual.nil?  |
| eq(expected)  | actual.eq? expected  |
| expect{...}.to raise_error  |   |
| match(/expression/)   | actual =~ /expression/  |
| start_with(expected)  | actual.start_with? expected  |
| end_with(expected)  | actual.end_with? expected  |
