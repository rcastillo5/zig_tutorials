const std = @import("std");
const expect = std.testing.expect;
const print = std.debug.print;

pub fn main() void {
    // constVarsAndArrays();
    // ifElse();

    // whileNoContinue();
    // whileWithContinueExpression();
    // whileWithContinue();
    // forLoop();
    // var x: u32 = addFive(10);
    // print("value of x is {}\n", .{x});
    var f: u16 = 0;
    f = fibonacci(5);
    print("Fibonacci of {} is {}\n", .{ 5, f });
    print("Fibonacci of {} is {}\n", .{ 5, fibonacci(5) });
}

// recursion is not working
fn fibonacci(n: u16) u16 {
    // if (n <= 1) return n;
    if (n == 0 or n == 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
}
fn addFive(x: u32) u32 {
    return x + 5;
}

pub fn forLoop() void {
    const str = [_]u8{ 'a', 'b', 'c' };

    for (str) |chr, i| {
        print("character is: {} and index is: {}\n", .{ chr, i });
    }
    for (str) |_, i| {
        print("index is: {}\n", .{i});
    }
    for (str) |chr| {
        print("character is: {}\n", .{chr});
    }

    // GO style where the underscore omits is not explicit.
    // might be more Ruby like.
    // Additionally, its item first, then index
    // for (str) |chr, _| {
    //     print("character is: {}\n", .{chr});
    // }

    // interesting that the for (str, 0..) notation does not work
    // for (str, 0..) |chr, i| {
    //     print("character is: {} and index is: {}\n", .{ chr, i });
    // }
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
