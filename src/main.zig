const std = @import("std");

usingnamespace @import("raylib.zig");
usingnamespace @import("chipmunk.zig");
const Sandbox = @import("Sandbox.zig");

const windowWidth = 800;
const windowHeight = 600;

pub fn main() anyerror!void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = &gpa.allocator;

    InitWindow(windowWidth, windowHeight, "Hello world");
    defer CloseWindow();

    const gravity = cpv(0, 100);

    var sandbox: Sandbox = undefined;
    const boundaryFriction = 1;
    try sandbox.init(allocator, windowWidth, windowHeight, gravity, boundaryFriction);
    defer sandbox.deinit();

    const center = cpv(windowWidth / 2, windowHeight / 2);
    const radius = 50;
    const density = 1;
    const friction = 0.7;
    const ballBody = try sandbox.addCircle(center, radius, density, friction);

    SetTargetFPS(60);

    while (!WindowShouldClose()) {
        sandbox.step(GetFrameTime());

        BeginDrawing();
        ClearBackground(Color.RAYWHITE);
        DrawText("Hello chipmunk", 100, 100, 20, Color.BLACK);

        var pos: cpVect = cpBodyGetPosition(ballBody);
        DrawCircleLines(@floatToInt(c_int, pos.x), @floatToInt(c_int, pos.y), @floatCast(f32, radius), Color.BLACK);

        EndDrawing();
    }
}
