const std = @import("std");
const vec = @import("vec.zig");
const ArrayList = std.ArrayList;

pub fn main() !void {
    try render();
}

fn render() !void {
    const width = 1024;
    const height = 768;

    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();

    var framebuffer = ArrayList(vec.vec3).init(allocator);
    defer framebuffer.deinit();
    try framebuffer.resize(width * height);

    for (0..height) |j| {
        for (0..width) |i| {
            framebuffer.items[i + j * width] = vec.vec3{ j / @as(f64, height), i / @as(f64, width), 0 };
        }
    }

    const file = try std.fs.cwd().createFile(
        "junk_file.txt",
        .{ .read = true },
    );
    defer file.close();

    try file.write("P6\n{}, {}\n255\n");
}
