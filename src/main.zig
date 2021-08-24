const std = @import("std");
const ArrayList = std.ArrayList;

usingnamespace @import("raylib.zig");
usingnamespace @import("chipmunk.zig");
const Sandbox = @import("Sandbox.zig");

const windowWidth = 800;
const windowHeight = 600;

const Circle = struct {
    body: *cpBody,
    radius: cpFloat,

    pub fn draw(self: @This(), color: Color) void {
        const pos = cpBodyGetPosition(self.body);
        DrawCircleLines(@floatToInt(c_int, pos.x), @floatToInt(c_int, pos.y), @floatCast(f32, self.radius), color);
    }
};

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

    var circles = ArrayList(Circle).init(allocator);

    SetTargetFPS(60);

    while (!WindowShouldClose()) {
        if (IsMouseButtonPressed(.LEFT)) {
            const center = cpv(@intToFloat(f64, GetMouseX()), @intToFloat(f64, GetMouseY()));
            const radius = 20;
            const density = 1;
            const friction = 0.7;
            const ballBody = try sandbox.addCircle(center, radius, density, friction);
            try circles.append(.{.body=ballBody, .radius=radius});
        }
        sandbox.step(GetFrameTime());

        BeginDrawing();
        ClearBackground(Color.RAYWHITE);
        DrawText(
            \\Hello chipmunk
            \\Click to spawn a circle
        , 100, 100, 20, Color.BLACK);

        for (circles.items) |c| {
            c.draw(Color.BLACK);
        }

        EndDrawing();
    }
}
