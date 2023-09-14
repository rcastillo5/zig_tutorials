const std = @import("std");
const expect = std.testing.expect;
const print = std.debug.print;

pub fn main() void {
    // constVarsAndArrays();
    // ifElse();

    // whileNoContinue();
    // whileWithContinueExpression();
    whileWithContinue();
}

pub fn whileWithContinue() void {
    var sum: u8 = 0;
    var i: u8 = 1;
    while (i <= 10) : (i += 1) {
        if (i % 2 == 0) continue;
        if (sum == 16) break;
        sum += i;
        print("value of sum is {}\n", .{sum});
    }
}

pub fn ifElse() void {
    var x: u16 = 0;
    if (false) {
        x += 1;
        print("value of x is {}\n", .{x});
    } else {
        x += 4;
        print("value of x is {}\n", .{x});
    }

    var y: i16 = 0;
    y += if (false) 24 else -5;
    print("value of y is {}\n", .{y});

    // try expect(x == 1);
}

pub fn constVarsAndArrays() void {
    // variables
    const constant: i32 = 5;
    _ = constant;
    var variable: u32 = 5000;
    _ = variable;

    const inferred_constant = @as(i32, 5);
    _ = inferred_constant;
    var inferred_var = @as(u32, 5000);
    _ = inferred_var;

    const a: i32 = undefined;
    _ = a;
    var b: u32 = undefined;
    _ = b;

    // arrays
    const c = [5]u8{ 'h', 'e', 'l', 'l', 'o' };
    _ = c;
    const d = [_]u8{ 'w', 'o', 'r', 'd' };

    const length = d.len;
    print("word length is {}\n", .{length});
    // still need to find append function to array
}

pub fn whileNoContinue() void {
    var i: u8 = 4;
    while (i < 80) {
        i *= 3;
    }
    print("value of i is {}\n", .{i});
}

// while with continue expression is very similar to for loop in JS
pub fn whileWithContinueExpression() void {
    var sum: u8 = 0;
    var i: u8 = 1;
    while (i <= 10) : (i += 1) {
        sum += i;
        print("value of sum is {}\n", .{sum});
        print("value of i is {}\n", .{i});
    }
}
test "if statement" {
    const a = true;
    var x: u16 = 0;
    if (a) {
        x += 1;
    } else {
        x += 4;
    }

    try expect(x == 1);
}

test "if statement terniary operation" {
    var x: u16 = 0;
    x += if (true) 21 else 5;
    try expect(x == 1);
}
