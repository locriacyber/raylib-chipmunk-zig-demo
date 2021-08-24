const std = @import("std");
const ArrayList = std.ArrayList;
const Allocator = std.mem.Allocator;
usingnamespace @import("chipmunk.zig");

width: cpFloat,
height: cpFloat,
space: *cpSpace,
bodyList: ArrayList(*cpBody),
shapeList: ArrayList(*cpShape),

const Self = @This();

pub fn init(self: *Self, allocator: *Allocator, width: cpFloat, height: cpFloat, gravity: cpVect, boundaryFriction: cpFloat) !void {
    self.width = width;
    self.height = height;
    self.bodyList = ArrayList(*cpBody).init(allocator);
    self.shapeList = ArrayList(*cpShape).init(allocator);
    self.space = cpSpaceNew() orelse return error.OutOfMemory;
    cpSpaceSetGravity(self.space, gravity);
    _ = try self.addStaticSegment(0, height, width, height, boundaryFriction); // ground
    _ = try self.addStaticSegment(0, 0, width, 0, boundaryFriction); // ceiling
    _ = try self.addStaticSegment(0, 0, 0, height, boundaryFriction); // wallLeft
    _ = try self.addStaticSegment(width, 0, width, height, boundaryFriction); // wallRight
}

pub fn deinit(self: *Self) void {
    for (self.shapeList.items) |shape| {
        cpShapeFree(shape);
    }
    self.shapeList.deinit();

    for (self.bodyList.items) |body| {
        cpBodyFree(body);
    }
    self.bodyList.deinit();

    cpSpaceFree(self.space);
}

pub fn step(self: *Self, stepTime: cpFloat) void {
    cpSpaceStep(self.space, stepTime);
}

pub fn addBody(self: *Self, body: *cpBody) !*cpBody {
    _ = cpSpaceAddBody(self.space, body) orelse return error.OutOfMemory;
    try self.bodyList.append(body);
    return body;
}

pub fn addShape(self: *Self, shape: *cpShape) !*cpShape {
    _ = cpSpaceAddShape(self.space, shape) orelse return error.OutOfMemory;
    try self.shapeList.append(shape);
    return shape;
}

pub fn addStaticSegment(self: *Self, x0: cpFloat, y0: cpFloat, x1: cpFloat, y1: cpFloat, friction: cpFloat) !*cpShape {
    var segment: *cpShape = cpSegmentShapeNew(cpSpaceGetStaticBody(self.space), cpv(x0, y0), cpv(x1, y1), 0) orelse return error.OutOfMemory;
    cpShapeSetFriction(segment, friction);
    return try self.addShape(segment);
}

pub fn addCircle(self: *Self, center: cpVect, radius: cpFloat, density: cpFloat, friction: cpFloat) !*cpBody {
    const mass: cpFloat = density * radius * radius * CP_PI;
    const moment: cpFloat = cpMomentForCircle(mass, 0, radius, cpvzero);
    const ballBody: *cpBody = try self.addBody(cpBodyNew(mass, moment) orelse return error.OutOfMemory);
    cpBodySetPosition(ballBody, center);
    const ballShape: *cpShape = try self.addShape(cpCircleShapeNew(ballBody, radius, cpvzero) orelse return error.OutOfMemory);
    cpShapeSetFriction(ballShape, friction);
    return ballBody;
}
