const std = @import("std");
const dirname = std.fs.path.dirname;
const join = std.fs.path.join;

pub fn addPackage(allocator: *std.mem.Allocator, exe: *std.build.LibExeObjStep) void {
    const dir: []const u8 = dirname(@src().file) orelse "";
    exe.linkLibC();
    exe.linkSystemLibrary("raylib");
    exe.addPackagePath("raylib", join(allocator, &.{dir, "lib.zig"}) catch unreachable);
}
