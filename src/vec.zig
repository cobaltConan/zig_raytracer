const std = @import("std");
const math = @import("math");

pub const vec3 = struct {
    x: f64 = 0,
    y: f64 = 0,
    z: f64 = 0,

    pub fn add(self: *vec3, other: *vec3) vec3 {
        var vec: vec3 = {};
        vec.x = self.x + other.x;
        vec.y = self.y + other.y;
        vec.z = self.z + other.z;
        return vec;
    }

    pub fn sub(self: *vec3, other: *vec3) vec3 {
        var vec: vec3 = {};
        vec.x = self.x - other.x;
        vec.y = self.y - other.y;
        vec.z = self.z - other.z;
        return vec;
    }

    pub fn dot(self: *vec3, other: *vec3) vec3 {
        var vec: vec3 = {};
        vec.x = self.x * other.x;
        vec.y = self.y * other.y;
        vec.z = self.z * other.z;
        return vec;
    }

    pub fn mult(self: *vec3, val: f64) void {
        var vec: vec3 = {};
        vec.x = self.x * val;
        vec.y = self.y * val;
        vec.z = self.z * val;
        return vec;
    }

    pub fn invert(self: *vec3) void {
        var vec: vec3 = {};
        vec.x = -self.x;
        vec.y = -self.y;
        vec.z = -self.z;
        return vec;
    }

    pub fn norm(self: *vec3) f64 {
        return math.sqrt(self.x * self.x + self.y * self.y + self.z * self.z);
    }

    pub fn normalised(self: *vec3) vec3 {
        return self.mult(1 / self.norm());
    }

    pub fn cross(self: *vec3, other: *vec3) vec3 {
        var vec: vec3 = {};
        vec.x = self.y * other.z - self.z * other.y;
        vec.y = self.z * other.x - self.x * other.z;
        vec.z = self.x * other.y - self.y * other.x;
        return vec;
    }

    pub fn print(self: *vec3) !void {
        // var gpa = std.heap.GeneralPurposeAllocator(.{}){};
        // const allocator = gpa.allocator();
        // var list = std.ArrayList(u8).init(allocator);
        // defer list.deinit();

        std.debug.print("x: {d}, y: {d}, z: {d}\n", .{ self.x, self.y, self.z });
    }
};
