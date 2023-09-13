const std = @import("std");

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
}
