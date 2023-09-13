const std = @import("std");
const expect = std.testing.expect;

pub fn main() void {
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
    std.debug.print("word length is {}\n", .{length});
    // still need to find append function to array

    var x: u16 = 0;
    if (false) {
        x += 1;
        std.debug.print("value of x is {}\n", .{x});
    } else {
        x += 4;
        std.debug.print("value of x is {}\n", .{x});
    }

    // try expect(x == 1);
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
