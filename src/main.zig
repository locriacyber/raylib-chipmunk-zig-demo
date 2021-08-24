const std = @import("std");
usingnamespace @import("raylib");

pub fn main() anyerror!void {
    InitWindow(800,600,"Hello world");
    defer CloseWindow();
    while (!WindowShouldClose()) {
        BeginDrawing();
        ClearBackground(Color.RAYWHITE);
        DrawText("text", 100, 100, 20, Color.BLACK);
        EndDrawing();
    }
}
