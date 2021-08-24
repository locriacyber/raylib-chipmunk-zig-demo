usingnamespace @import("std").zig.c_builtins;

pub extern fn cpMessage(condition: [*c]const u8, file: [*c]const u8, line: c_int, isError: c_int, isHardError: c_int, message: [*c]const u8, ...) void;
pub const cpFloat = f64;
pub fn cpfmax(arg_a: cpFloat, arg_b: cpFloat) cpFloat {
    var a = arg_a;
    var b = arg_b;
    return if (a > b) a else b;
}
pub fn cpfmin(arg_a: cpFloat, arg_b: cpFloat) cpFloat {
    var a = arg_a;
    var b = arg_b;
    return if (a < b) a else b;
}
pub fn cpfabs(arg_f: cpFloat) cpFloat {
    var f = arg_f;
    return if (f < @intToFloat(f64, @as(c_int, 0))) -f else f;
}
pub fn cpfclamp(arg_f: cpFloat, arg_min: cpFloat, arg_max: cpFloat) cpFloat {
    var f = arg_f;
    var min = arg_min;
    var max = arg_max;
    return cpfmin(cpfmax(f, min), max);
}
pub fn cpfclamp01(arg_f: cpFloat) cpFloat {
    var f = arg_f;
    return cpfmax(@floatCast(cpFloat, 0.0), cpfmin(f, @floatCast(cpFloat, 1.0)));
}
pub fn cpflerp(arg_f1: cpFloat, arg_f2: cpFloat, arg_t: cpFloat) cpFloat {
    var f1 = arg_f1;
    var f2 = arg_f2;
    var t = arg_t;
    return (f1 * (@floatCast(f64, 1.0) - t)) + (f2 * t);
}
pub fn cpflerpconst(arg_f1: cpFloat, arg_f2: cpFloat, arg_d: cpFloat) cpFloat {
    var f1 = arg_f1;
    var f2 = arg_f2;
    var d = arg_d;
    return f1 + cpfclamp(f2 - f1, -d, d);
}
pub const cpHashValue = usize;
pub const cpCollisionID = u32;
pub const cpBool = u8;
pub const cpDataPointer = ?*c_void;
pub const cpCollisionType = usize;
pub const cpGroup = usize;
pub const cpBitmask = c_uint;
pub const cpTimestamp = c_uint;
const struct_cpVect = extern struct {
    x: cpFloat,
    y: cpFloat,
};
pub const cpVect = struct_cpVect;
const struct_cpTransform = extern struct {
    a: cpFloat,
    b: cpFloat,
    c: cpFloat,
    d: cpFloat,
    tx: cpFloat,
    ty: cpFloat,
};
pub const cpTransform = struct_cpTransform;
const struct_cpMat2x2 = extern struct {
    a: cpFloat,
    b: cpFloat,
    c: cpFloat,
    d: cpFloat,
};
pub const cpMat2x2 = struct_cpMat2x2;
const struct_cpArray = opaque {};
pub const cpArray = struct_cpArray;
const struct_cpHashSet = opaque {};
pub const cpHashSet = struct_cpHashSet;
const struct_cpBody = opaque {};
pub const cpBody = struct_cpBody;
const struct_cpShape = opaque {};
pub const cpShape = struct_cpShape;
const struct_cpCircleShape = opaque {};
pub const cpCircleShape = struct_cpCircleShape;
const struct_cpSegmentShape = opaque {};
pub const cpSegmentShape = struct_cpSegmentShape;
const struct_cpPolyShape = opaque {};
pub const cpPolyShape = struct_cpPolyShape;
const struct_cpConstraint = opaque {};
pub const cpConstraint = struct_cpConstraint;
const struct_cpPinJoint = opaque {};
pub const cpPinJoint = struct_cpPinJoint;
const struct_cpSlideJoint = opaque {};
pub const cpSlideJoint = struct_cpSlideJoint;
const struct_cpPivotJoint = opaque {};
pub const cpPivotJoint = struct_cpPivotJoint;
const struct_cpGrooveJoint = opaque {};
pub const cpGrooveJoint = struct_cpGrooveJoint;
const struct_cpDampedSpring = opaque {};
pub const cpDampedSpring = struct_cpDampedSpring;
const struct_cpDampedRotarySpring = opaque {};
pub const cpDampedRotarySpring = struct_cpDampedRotarySpring;
const struct_cpRotaryLimitJoint = opaque {};
pub const cpRotaryLimitJoint = struct_cpRotaryLimitJoint;
const struct_cpRatchetJoint = opaque {};
pub const cpRatchetJoint = struct_cpRatchetJoint;
const struct_cpGearJoint = opaque {};
pub const cpGearJoint = struct_cpGearJoint;
const struct_cpSimpleMotorJoint = opaque {};
pub const cpSimpleMotorJoint = struct_cpSimpleMotorJoint;
const struct_cpArbiter = opaque {};
pub const cpArbiter = struct_cpArbiter;
const struct_cpSpace = opaque {};
pub const cpSpace = struct_cpSpace;
pub const cpCollisionBeginFunc = ?fn (?*cpArbiter, ?*cpSpace, cpDataPointer) callconv(.C) cpBool;
pub const cpCollisionPreSolveFunc = ?fn (?*cpArbiter, ?*cpSpace, cpDataPointer) callconv(.C) cpBool;
pub const cpCollisionPostSolveFunc = ?fn (?*cpArbiter, ?*cpSpace, cpDataPointer) callconv(.C) void;
pub const cpCollisionSeparateFunc = ?fn (?*cpArbiter, ?*cpSpace, cpDataPointer) callconv(.C) void;
const struct_cpCollisionHandler = extern struct {
    typeA: cpCollisionType,
    typeB: cpCollisionType,
    beginFunc: cpCollisionBeginFunc,
    preSolveFunc: cpCollisionPreSolveFunc,
    postSolveFunc: cpCollisionPostSolveFunc,
    separateFunc: cpCollisionSeparateFunc,
    userData: cpDataPointer,
};
pub const cpCollisionHandler = struct_cpCollisionHandler;
const struct_unnamed_6 = extern struct {
    pointA: cpVect,
    pointB: cpVect,
    distance: cpFloat,
};
const struct_cpContactPointSet = extern struct {
    count: c_int,
    normal: cpVect,
    points: [2]struct_unnamed_6,
};
pub const cpContactPointSet = struct_cpContactPointSet;
pub const cpvzero: cpVect = cpVect{
    .x = @floatCast(cpFloat, 0.0),
    .y = @floatCast(cpFloat, 0.0),
};
pub fn cpv(x: cpFloat, y: cpFloat) cpVect {
    var v: cpVect = cpVect{
        .x = x,
        .y = y,
    };
    return v;
}
pub fn cpveql(v1: cpVect, v2: cpVect) cpBool {
    return @bitCast(cpBool, @truncate(i8, @boolToInt((v1.x == v2.x) and (v1.y == v2.y))));
}
pub fn cpvadd(v1: cpVect, v2: cpVect) cpVect {
    return cpv(v1.x + v2.x, v1.y + v2.y);
}
pub fn cpvsub(v1: cpVect, v2: cpVect) cpVect {
    return cpv(v1.x - v2.x, v1.y - v2.y);
}
pub fn cpvneg(v: cpVect) cpVect {
    return cpv(-v.x, -v.y);
}
pub fn cpvmult(v: cpVect, s: cpFloat) cpVect {
    return cpv(v.x * s, v.y * s);
}
pub fn cpvdot(v1: cpVect, v2: cpVect) cpFloat {
    return (v1.x * v2.x) + (v1.y * v2.y);
}
pub fn cpvcross(v1: cpVect, v2: cpVect) cpFloat {
    return (v1.x * v2.y) - (v1.y * v2.x);
}
pub fn cpvperp(v: cpVect) cpVect {
    return cpv(-v.y, v.x);
}
pub fn cpvrperp(v: cpVect) cpVect {
    return cpv(v.y, -v.x);
}
pub fn cpvproject(v1: cpVect, v2: cpVect) cpVect {
    return cpvmult(v2, cpvdot(v1, v2) / cpvdot(v2, v2));
}
pub fn cpvforangle(a: cpFloat) cpVect {
    return cpv(cos(a), sin(a));
}
pub fn cpvtoangle(v: cpVect) cpFloat {
    return atan2(v.y, v.x);
}
pub fn cpvrotate(v1: cpVect, v2: cpVect) cpVect {
    return cpv((v1.x * v2.x) - (v1.y * v2.y), (v1.x * v2.y) + (v1.y * v2.x));
}
pub fn cpvunrotate(v1: cpVect, v2: cpVect) cpVect {
    return cpv((v1.x * v2.x) + (v1.y * v2.y), (v1.y * v2.x) - (v1.x * v2.y));
}
pub fn cpvlengthsq(v: cpVect) cpFloat {
    return cpvdot(v, v);
}
pub fn cpvlength(v: cpVect) cpFloat {
    return sqrt(cpvdot(v, v));
}
pub fn cpvlerp(v1: cpVect, v2: cpVect, t: cpFloat) cpVect {
    return cpvadd(cpvmult(v1, @floatCast(f64, 1.0) - t), cpvmult(v2, t));
}
pub fn cpvnormalize(v: cpVect) cpVect {
    return cpvmult(v, @floatCast(f64, 1.0) / (cpvlength(v) + 0.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000022250738585072014));
}
pub fn cpvslerp(v1: cpVect, v2: cpVect, t: cpFloat) cpVect {
    var dot: cpFloat = cpvdot(cpvnormalize(v1), cpvnormalize(v2));
    var omega: cpFloat = acos(cpfclamp(dot, @floatCast(cpFloat, -1.0), @floatCast(cpFloat, 1.0)));
    if (omega < 0.001) {
        return cpvlerp(v1, v2, t);
    } else {
        var denom: cpFloat = @floatCast(f64, 1.0) / sin(omega);
        return cpvadd(cpvmult(v1, sin((@floatCast(f64, 1.0) - t) * omega) * denom), cpvmult(v2, sin(t * omega) * denom));
    }
    return @import("std").mem.zeroes(struct_cpVect);
}
pub fn cpvslerpconst(v1: cpVect, v2: cpVect, a: cpFloat) cpVect {
    var dot: cpFloat = cpvdot(cpvnormalize(v1), cpvnormalize(v2));
    var omega: cpFloat = acos(cpfclamp(dot, @floatCast(cpFloat, -1.0), @floatCast(cpFloat, 1.0)));
    return cpvslerp(v1, v2, cpfmin(a, omega) / omega);
}
pub fn cpvclamp(v: cpVect, len: cpFloat) cpVect {
    return if (cpvdot(v, v) > (len * len)) cpvmult(cpvnormalize(v), len) else v;
}
pub fn cpvlerpconst(arg_v1: cpVect, arg_v2: cpVect, arg_d: cpFloat) cpVect {
    var v1 = arg_v1;
    var v2 = arg_v2;
    var d = arg_d;
    return cpvadd(v1, cpvclamp(cpvsub(v2, v1), d));
}
pub fn cpvdist(v1: cpVect, v2: cpVect) cpFloat {
    return cpvlength(cpvsub(v1, v2));
}
pub fn cpvdistsq(v1: cpVect, v2: cpVect) cpFloat {
    return cpvlengthsq(cpvsub(v1, v2));
}
pub fn cpvnear(v1: cpVect, v2: cpVect, dist: cpFloat) cpBool {
    return @bitCast(cpBool, @truncate(i8, @boolToInt(cpvdistsq(v1, v2) < (dist * dist))));
}
pub fn cpMat2x2New(arg_a: cpFloat, arg_b: cpFloat, arg_c: cpFloat, arg_d: cpFloat) cpMat2x2 {
    var a = arg_a;
    var b = arg_b;
    var c = arg_c;
    var d = arg_d;
    var m: cpMat2x2 = cpMat2x2{
        .a = a,
        .b = b,
        .c = c,
        .d = d,
    };
    return m;
}
pub fn cpMat2x2Transform(arg_m: cpMat2x2, arg_v: cpVect) cpVect {
    var m = arg_m;
    var v = arg_v;
    return cpv((v.x * m.a) + (v.y * m.b), (v.x * m.c) + (v.y * m.d));
}
const struct_cpBB = extern struct {
    l: cpFloat,
    b: cpFloat,
    r: cpFloat,
    t: cpFloat,
};
pub const cpBB = struct_cpBB;
pub fn cpBBNew(l: cpFloat, b: cpFloat, r: cpFloat, t: cpFloat) cpBB {
    var bb: cpBB = cpBB{
        .l = l,
        .b = b,
        .r = r,
        .t = t,
    };
    return bb;
}
pub fn cpBBNewForExtents(c: cpVect, hw: cpFloat, hh: cpFloat) cpBB {
    return cpBBNew(c.x - hw, c.y - hh, c.x + hw, c.y + hh);
}
pub fn cpBBNewForCircle(p: cpVect, r: cpFloat) cpBB {
    return cpBBNewForExtents(p, r, r);
}
pub fn cpBBIntersects(a: cpBB, b: cpBB) cpBool {
    return @bitCast(cpBool, @truncate(i8, @boolToInt((((a.l <= b.r) and (b.l <= a.r)) and (a.b <= b.t)) and (b.b <= a.t))));
}
pub fn cpBBContainsBB(bb: cpBB, other: cpBB) cpBool {
    return @bitCast(cpBool, @truncate(i8, @boolToInt((((bb.l <= other.l) and (bb.r >= other.r)) and (bb.b <= other.b)) and (bb.t >= other.t))));
}
pub fn cpBBContainsVect(bb: cpBB, v: cpVect) cpBool {
    return @bitCast(cpBool, @truncate(i8, @boolToInt((((bb.l <= v.x) and (bb.r >= v.x)) and (bb.b <= v.y)) and (bb.t >= v.y))));
}
pub fn cpBBMerge(a: cpBB, b: cpBB) cpBB {
    return cpBBNew(cpfmin(a.l, b.l), cpfmin(a.b, b.b), cpfmax(a.r, b.r), cpfmax(a.t, b.t));
}
pub fn cpBBExpand(bb: cpBB, v: cpVect) cpBB {
    return cpBBNew(cpfmin(bb.l, v.x), cpfmin(bb.b, v.y), cpfmax(bb.r, v.x), cpfmax(bb.t, v.y));
}
pub fn cpBBCenter(arg_bb: cpBB) cpVect {
    var bb = arg_bb;
    return cpvlerp(cpv(bb.l, bb.b), cpv(bb.r, bb.t), @floatCast(cpFloat, 0.5));
}
pub fn cpBBArea(arg_bb: cpBB) cpFloat {
    var bb = arg_bb;
    return (bb.r - bb.l) * (bb.t - bb.b);
}
pub fn cpBBMergedArea(arg_a: cpBB, arg_b: cpBB) cpFloat {
    var a = arg_a;
    var b = arg_b;
    return (cpfmax(a.r, b.r) - cpfmin(a.l, b.l)) * (cpfmax(a.t, b.t) - cpfmin(a.b, b.b));
}
pub fn cpBBSegmentQuery(arg_bb: cpBB, arg_a: cpVect, arg_b: cpVect) cpFloat {
    var bb = arg_bb;
    var a = arg_a;
    var b = arg_b;
    var delta: cpVect = cpvsub(b, a);
    var tmin: cpFloat = @floatCast(cpFloat, -__builtin_inff());
    var tmax: cpFloat = @floatCast(cpFloat, __builtin_inff());
    if (delta.x == @floatCast(f64, 0.0)) {
        if ((a.x < bb.l) or (bb.r < a.x)) return @floatCast(cpFloat, __builtin_inff());
    } else {
        var t1: cpFloat = (bb.l - a.x) / delta.x;
        var t2: cpFloat = (bb.r - a.x) / delta.x;
        tmin = cpfmax(tmin, cpfmin(t1, t2));
        tmax = cpfmin(tmax, cpfmax(t1, t2));
    }
    if (delta.y == @floatCast(f64, 0.0)) {
        if ((a.y < bb.b) or (bb.t < a.y)) return @floatCast(cpFloat, __builtin_inff());
    } else {
        var t1: cpFloat = (bb.b - a.y) / delta.y;
        var t2: cpFloat = (bb.t - a.y) / delta.y;
        tmin = cpfmax(tmin, cpfmin(t1, t2));
        tmax = cpfmin(tmax, cpfmax(t1, t2));
    }
    if (((tmin <= tmax) and (@floatCast(f64, 0.0) <= tmax)) and (tmin <= @floatCast(f64, 1.0))) {
        return cpfmax(tmin, @floatCast(cpFloat, 0.0));
    } else {
        return @floatCast(cpFloat, __builtin_inff());
    }
    return 0;
}
pub fn cpBBIntersectsSegment(arg_bb: cpBB, arg_a: cpVect, arg_b: cpVect) cpBool {
    var bb = arg_bb;
    var a = arg_a;
    var b = arg_b;
    return @bitCast(cpBool, @truncate(i8, @boolToInt(cpBBSegmentQuery(bb, a, b) != @floatCast(f64, __builtin_inff()))));
}
pub fn cpBBClampVect(bb: cpBB, v: cpVect) cpVect {
    return cpv(cpfclamp(v.x, bb.l, bb.r), cpfclamp(v.y, bb.b, bb.t));
}
pub fn cpBBWrapVect(bb: cpBB, v: cpVect) cpVect {
    var dx: cpFloat = cpfabs(bb.r - bb.l);
    var modx: cpFloat = fmod(v.x - bb.l, dx);
    var x: cpFloat = if (modx > @floatCast(f64, 0.0)) modx else modx + dx;
    var dy: cpFloat = cpfabs(bb.t - bb.b);
    var mody: cpFloat = fmod(v.y - bb.b, dy);
    var y: cpFloat = if (mody > @floatCast(f64, 0.0)) mody else mody + dy;
    return cpv(x + bb.l, y + bb.b);
}
pub fn cpBBOffset(bb: cpBB, v: cpVect) cpBB {
    return cpBBNew(bb.l + v.x, bb.b + v.y, bb.r + v.x, bb.t + v.y);
}
pub const cpTransformIdentity: cpTransform = cpTransform{
    .a = @floatCast(cpFloat, 1.0),
    .b = @floatCast(cpFloat, 0.0),
    .c = @floatCast(cpFloat, 0.0),
    .d = @floatCast(cpFloat, 1.0),
    .tx = @floatCast(cpFloat, 0.0),
    .ty = @floatCast(cpFloat, 0.0),
};
pub fn cpTransformNew(arg_a: cpFloat, arg_b: cpFloat, arg_c: cpFloat, arg_d: cpFloat, arg_tx: cpFloat, arg_ty: cpFloat) cpTransform {
    var a = arg_a;
    var b = arg_b;
    var c = arg_c;
    var d = arg_d;
    var tx = arg_tx;
    var ty = arg_ty;
    var t: cpTransform = cpTransform{
        .a = a,
        .b = b,
        .c = c,
        .d = d,
        .tx = tx,
        .ty = ty,
    };
    return t;
}
pub fn cpTransformNewTranspose(arg_a: cpFloat, arg_c: cpFloat, arg_tx: cpFloat, arg_b: cpFloat, arg_d: cpFloat, arg_ty: cpFloat) cpTransform {
    var a = arg_a;
    var c = arg_c;
    var tx = arg_tx;
    var b = arg_b;
    var d = arg_d;
    var ty = arg_ty;
    var t: cpTransform = cpTransform{
        .a = a,
        .b = b,
        .c = c,
        .d = d,
        .tx = tx,
        .ty = ty,
    };
    return t;
}
pub fn cpTransformInverse(arg_t: cpTransform) cpTransform {
    var t = arg_t;
    var inv_det: cpFloat = 1.0 / ((t.a * t.d) - (t.c * t.b));
    return cpTransformNewTranspose(t.d * inv_det, -t.c * inv_det, ((t.c * t.ty) - (t.tx * t.d)) * inv_det, -t.b * inv_det, t.a * inv_det, ((t.tx * t.b) - (t.a * t.ty)) * inv_det);
}
pub fn cpTransformMult(arg_t1: cpTransform, arg_t2: cpTransform) cpTransform {
    var t1 = arg_t1;
    var t2 = arg_t2;
    return cpTransformNewTranspose((t1.a * t2.a) + (t1.c * t2.b), (t1.a * t2.c) + (t1.c * t2.d), ((t1.a * t2.tx) + (t1.c * t2.ty)) + t1.tx, (t1.b * t2.a) + (t1.d * t2.b), (t1.b * t2.c) + (t1.d * t2.d), ((t1.b * t2.tx) + (t1.d * t2.ty)) + t1.ty);
}
pub fn cpTransformPoint(arg_t: cpTransform, arg_p: cpVect) cpVect {
    var t = arg_t;
    var p = arg_p;
    return cpv(((t.a * p.x) + (t.c * p.y)) + t.tx, ((t.b * p.x) + (t.d * p.y)) + t.ty);
}
pub fn cpTransformVect(arg_t: cpTransform, arg_v: cpVect) cpVect {
    var t = arg_t;
    var v = arg_v;
    return cpv((t.a * v.x) + (t.c * v.y), (t.b * v.x) + (t.d * v.y));
}
pub fn cpTransformbBB(arg_t: cpTransform, arg_bb: cpBB) cpBB {
    var t = arg_t;
    var bb = arg_bb;
    var center: cpVect = cpBBCenter(bb);
    var hw: cpFloat = (bb.r - bb.l) * 0.5;
    var hh: cpFloat = (bb.t - bb.b) * 0.5;
    var a: cpFloat = t.a * hw;
    var b: cpFloat = t.c * hh;
    var d: cpFloat = t.b * hw;
    var e: cpFloat = t.d * hh;
    var hw_max: cpFloat = cpfmax(cpfabs(a + b), cpfabs(a - b));
    var hh_max: cpFloat = cpfmax(cpfabs(d + e), cpfabs(d - e));
    return cpBBNewForExtents(cpTransformPoint(t, center), hw_max, hh_max);
}
pub fn cpTransformTranslate(arg_translate: cpVect) cpTransform {
    var translate = arg_translate;
    return cpTransformNewTranspose(1.0, 0.0, translate.x, 0.0, 1.0, translate.y);
}
pub fn cpTransformScale(arg_scaleX: cpFloat, arg_scaleY: cpFloat) cpTransform {
    var scaleX = arg_scaleX;
    var scaleY = arg_scaleY;
    return cpTransformNewTranspose(scaleX, 0.0, 0.0, 0.0, scaleY, 0.0);
}
pub fn cpTransformRotate(arg_radians: cpFloat) cpTransform {
    var radians = arg_radians;
    var rot: cpVect = cpvforangle(radians);
    return cpTransformNewTranspose(rot.x, -rot.y, 0.0, rot.y, rot.x, 0.0);
}
pub fn cpTransformRigid(arg_translate: cpVect, arg_radians: cpFloat) cpTransform {
    var translate = arg_translate;
    var radians = arg_radians;
    var rot: cpVect = cpvforangle(radians);
    return cpTransformNewTranspose(rot.x, -rot.y, translate.x, rot.y, rot.x, translate.y);
}
pub fn cpTransformRigidInverse(arg_t: cpTransform) cpTransform {
    var t = arg_t;
    return cpTransformNewTranspose(t.d, -t.c, (t.c * t.ty) - (t.tx * t.d), -t.b, t.a, (t.tx * t.b) - (t.a * t.ty));
}
pub fn cpTransformWrap(arg_outer: cpTransform, arg_inner: cpTransform) cpTransform {
    var outer = arg_outer;
    var inner = arg_inner;
    return cpTransformMult(cpTransformInverse(outer), cpTransformMult(inner, outer));
}
pub fn cpTransformWrapInverse(arg_outer: cpTransform, arg_inner: cpTransform) cpTransform {
    var outer = arg_outer;
    var inner = arg_inner;
    return cpTransformMult(outer, cpTransformMult(inner, cpTransformInverse(outer)));
}
pub fn cpTransformOrtho(arg_bb: cpBB) cpTransform {
    var bb = arg_bb;
    return cpTransformNewTranspose(2.0 / (bb.r - bb.l), 0.0, -(bb.r + bb.l) / (bb.r - bb.l), 0.0, 2.0 / (bb.t - bb.b), -(bb.t + bb.b) / (bb.t - bb.b));
}
pub fn cpTransformBoneScale(arg_v0: cpVect, arg_v1: cpVect) cpTransform {
    var v0 = arg_v0;
    var v1 = arg_v1;
    var d: cpVect = cpvsub(v1, v0);
    return cpTransformNewTranspose(d.x, -d.y, v0.x, d.y, d.x, v0.y);
}
pub fn cpTransformAxialScale(arg_axis: cpVect, arg_pivot: cpVect, arg_scale: cpFloat) cpTransform {
    var axis = arg_axis;
    var pivot = arg_pivot;
    var scale = arg_scale;
    var A: cpFloat = (axis.x * axis.y) * (scale - 1.0);
    var B: cpFloat = cpvdot(axis, pivot) * (1.0 - scale);
    return cpTransformNewTranspose(((scale * axis.x) * axis.x) + (axis.y * axis.y), A, axis.x * B, A, (axis.x * axis.x) + ((scale * axis.y) * axis.y), axis.y * B);
}
pub const cpSpatialIndexBBFunc = ?fn (?*c_void) callconv(.C) cpBB;
pub const cpSpatialIndexIteratorFunc = ?fn (?*c_void, ?*c_void) callconv(.C) void;
pub const cpSpatialIndexQueryFunc = ?fn (?*c_void, ?*c_void, cpCollisionID, ?*c_void) callconv(.C) cpCollisionID;
pub const cpSpatialIndexSegmentQueryFunc = ?fn (?*c_void, ?*c_void, ?*c_void) callconv(.C) cpFloat;
pub const cpSpatialIndexClass = struct_cpSpatialIndexClass;
const struct_cpSpatialIndex = extern struct {
    klass: [*c]cpSpatialIndexClass,
    bbfunc: cpSpatialIndexBBFunc,
    staticIndex: [*c]cpSpatialIndex,
    dynamicIndex: [*c]cpSpatialIndex,
};
pub const cpSpatialIndex = struct_cpSpatialIndex;
pub const cpSpatialIndexDestroyImpl = ?fn ([*c]cpSpatialIndex) callconv(.C) void;
pub const cpSpatialIndexCountImpl = ?fn ([*c]cpSpatialIndex) callconv(.C) c_int;
pub const cpSpatialIndexEachImpl = ?fn ([*c]cpSpatialIndex, cpSpatialIndexIteratorFunc, ?*c_void) callconv(.C) void;
pub const cpSpatialIndexContainsImpl = ?fn ([*c]cpSpatialIndex, ?*c_void, cpHashValue) callconv(.C) cpBool;
pub const cpSpatialIndexInsertImpl = ?fn ([*c]cpSpatialIndex, ?*c_void, cpHashValue) callconv(.C) void;
pub const cpSpatialIndexRemoveImpl = ?fn ([*c]cpSpatialIndex, ?*c_void, cpHashValue) callconv(.C) void;
pub const cpSpatialIndexReindexImpl = ?fn ([*c]cpSpatialIndex) callconv(.C) void;
pub const cpSpatialIndexReindexObjectImpl = ?fn ([*c]cpSpatialIndex, ?*c_void, cpHashValue) callconv(.C) void;
pub const cpSpatialIndexReindexQueryImpl = ?fn ([*c]cpSpatialIndex, cpSpatialIndexQueryFunc, ?*c_void) callconv(.C) void;
pub const cpSpatialIndexQueryImpl = ?fn ([*c]cpSpatialIndex, ?*c_void, cpBB, cpSpatialIndexQueryFunc, ?*c_void) callconv(.C) void;
pub const cpSpatialIndexSegmentQueryImpl = ?fn ([*c]cpSpatialIndex, ?*c_void, cpVect, cpVect, cpFloat, cpSpatialIndexSegmentQueryFunc, ?*c_void) callconv(.C) void;
const struct_cpSpatialIndexClass = extern struct {
    destroy: cpSpatialIndexDestroyImpl,
    count: cpSpatialIndexCountImpl,
    each: cpSpatialIndexEachImpl,
    contains: cpSpatialIndexContainsImpl,
    insert: cpSpatialIndexInsertImpl,
    remove: cpSpatialIndexRemoveImpl,
    reindex: cpSpatialIndexReindexImpl,
    reindexObject: cpSpatialIndexReindexObjectImpl,
    reindexQuery: cpSpatialIndexReindexQueryImpl,
    query: cpSpatialIndexQueryImpl,
    segmentQuery: cpSpatialIndexSegmentQueryImpl,
};
const struct_cpSpaceHash = opaque {};
pub const cpSpaceHash = struct_cpSpaceHash;
pub extern fn cpSpaceHashAlloc() ?*cpSpaceHash;
pub extern fn cpSpaceHashInit(hash: ?*cpSpaceHash, celldim: cpFloat, numcells: c_int, bbfunc: cpSpatialIndexBBFunc, staticIndex: [*c]cpSpatialIndex) [*c]cpSpatialIndex;
pub extern fn cpSpaceHashNew(celldim: cpFloat, cells: c_int, bbfunc: cpSpatialIndexBBFunc, staticIndex: [*c]cpSpatialIndex) [*c]cpSpatialIndex;
pub extern fn cpSpaceHashResize(hash: ?*cpSpaceHash, celldim: cpFloat, numcells: c_int) void;
const struct_cpBBTree = opaque {};
pub const cpBBTree = struct_cpBBTree;
pub extern fn cpBBTreeAlloc() ?*cpBBTree;
pub extern fn cpBBTreeInit(tree: ?*cpBBTree, bbfunc: cpSpatialIndexBBFunc, staticIndex: [*c]cpSpatialIndex) [*c]cpSpatialIndex;
pub extern fn cpBBTreeNew(bbfunc: cpSpatialIndexBBFunc, staticIndex: [*c]cpSpatialIndex) [*c]cpSpatialIndex;
pub extern fn cpBBTreeOptimize(index: [*c]cpSpatialIndex) void;
pub const cpBBTreeVelocityFunc = ?fn (?*c_void) callconv(.C) cpVect;
pub extern fn cpBBTreeSetVelocityFunc(index: [*c]cpSpatialIndex, func: cpBBTreeVelocityFunc) void;
const struct_cpSweep1D = opaque {};
pub const cpSweep1D = struct_cpSweep1D;
pub extern fn cpSweep1DAlloc() ?*cpSweep1D;
pub extern fn cpSweep1DInit(sweep: ?*cpSweep1D, bbfunc: cpSpatialIndexBBFunc, staticIndex: [*c]cpSpatialIndex) [*c]cpSpatialIndex;
pub extern fn cpSweep1DNew(bbfunc: cpSpatialIndexBBFunc, staticIndex: [*c]cpSpatialIndex) [*c]cpSpatialIndex;
pub extern fn cpSpatialIndexFree(index: [*c]cpSpatialIndex) void;
pub extern fn cpSpatialIndexCollideStatic(dynamicIndex: [*c]cpSpatialIndex, staticIndex: [*c]cpSpatialIndex, func: cpSpatialIndexQueryFunc, data: ?*c_void) void;
pub fn cpSpatialIndexDestroy(arg_index: [*c]cpSpatialIndex) void {
    var index = arg_index;
    if (index.*.klass != null) {
        index.*.klass.*.destroy.?(index);
    }
}
pub fn cpSpatialIndexCount(arg_index: [*c]cpSpatialIndex) c_int {
    var index = arg_index;
    return index.*.klass.*.count.?(index);
}
pub fn cpSpatialIndexEach(arg_index: [*c]cpSpatialIndex, arg_func: cpSpatialIndexIteratorFunc, arg_data: ?*c_void) void {
    var index = arg_index;
    var func = arg_func;
    var data = arg_data;
    index.*.klass.*.each.?(index, func, data);
}
pub fn cpSpatialIndexContains(arg_index: [*c]cpSpatialIndex, arg_obj: ?*c_void, arg_hashid: cpHashValue) cpBool {
    var index = arg_index;
    var obj = arg_obj;
    var hashid = arg_hashid;
    return index.*.klass.*.contains.?(index, obj, hashid);
}
pub fn cpSpatialIndexInsert(arg_index: [*c]cpSpatialIndex, arg_obj: ?*c_void, arg_hashid: cpHashValue) void {
    var index = arg_index;
    var obj = arg_obj;
    var hashid = arg_hashid;
    index.*.klass.*.insert.?(index, obj, hashid);
}
pub fn cpSpatialIndexRemove(arg_index: [*c]cpSpatialIndex, arg_obj: ?*c_void, arg_hashid: cpHashValue) void {
    var index = arg_index;
    var obj = arg_obj;
    var hashid = arg_hashid;
    index.*.klass.*.remove.?(index, obj, hashid);
}
pub fn cpSpatialIndexReindex(arg_index: [*c]cpSpatialIndex) void {
    var index = arg_index;
    index.*.klass.*.reindex.?(index);
}
pub fn cpSpatialIndexReindexObject(arg_index: [*c]cpSpatialIndex, arg_obj: ?*c_void, arg_hashid: cpHashValue) void {
    var index = arg_index;
    var obj = arg_obj;
    var hashid = arg_hashid;
    index.*.klass.*.reindexObject.?(index, obj, hashid);
}
pub fn cpSpatialIndexQuery(arg_index: [*c]cpSpatialIndex, arg_obj: ?*c_void, arg_bb: cpBB, arg_func: cpSpatialIndexQueryFunc, arg_data: ?*c_void) void {
    var index = arg_index;
    var obj = arg_obj;
    var bb = arg_bb;
    var func = arg_func;
    var data = arg_data;
    index.*.klass.*.query.?(index, obj, bb, func, data);
}
pub fn cpSpatialIndexSegmentQuery(arg_index: [*c]cpSpatialIndex, arg_obj: ?*c_void, arg_a: cpVect, arg_b: cpVect, arg_t_exit: cpFloat, arg_func: cpSpatialIndexSegmentQueryFunc, arg_data: ?*c_void) void {
    var index = arg_index;
    var obj = arg_obj;
    var a = arg_a;
    var b = arg_b;
    var t_exit = arg_t_exit;
    var func = arg_func;
    var data = arg_data;
    index.*.klass.*.segmentQuery.?(index, obj, a, b, t_exit, func, data);
}
pub fn cpSpatialIndexReindexQuery(arg_index: [*c]cpSpatialIndex, arg_func: cpSpatialIndexQueryFunc, arg_data: ?*c_void) void {
    var index = arg_index;
    var func = arg_func;
    var data = arg_data;
    index.*.klass.*.reindexQuery.?(index, func, data);
}
pub extern fn cpArbiterGetRestitution(arb: ?*const cpArbiter) cpFloat;
pub extern fn cpArbiterSetRestitution(arb: ?*cpArbiter, restitution: cpFloat) void;
pub extern fn cpArbiterGetFriction(arb: ?*const cpArbiter) cpFloat;
pub extern fn cpArbiterSetFriction(arb: ?*cpArbiter, friction: cpFloat) void;
pub extern fn cpArbiterGetSurfaceVelocity(arb: ?*cpArbiter) cpVect;
pub extern fn cpArbiterSetSurfaceVelocity(arb: ?*cpArbiter, vr: cpVect) void;
pub extern fn cpArbiterGetUserData(arb: ?*const cpArbiter) cpDataPointer;
pub extern fn cpArbiterSetUserData(arb: ?*cpArbiter, userData: cpDataPointer) void;
pub extern fn cpArbiterTotalImpulse(arb: ?*const cpArbiter) cpVect;
pub extern fn cpArbiterTotalKE(arb: ?*const cpArbiter) cpFloat;
pub extern fn cpArbiterIgnore(arb: ?*cpArbiter) cpBool;
pub extern fn cpArbiterGetShapes(arb: ?*const cpArbiter, a: [*c]?*cpShape, b: [*c]?*cpShape) void;
pub extern fn cpArbiterGetBodies(arb: ?*const cpArbiter, a: [*c]?*cpBody, b: [*c]?*cpBody) void;
pub extern fn cpArbiterGetContactPointSet(arb: ?*const cpArbiter) cpContactPointSet;
pub extern fn cpArbiterSetContactPointSet(arb: ?*cpArbiter, set: [*c]cpContactPointSet) void;
pub extern fn cpArbiterIsFirstContact(arb: ?*const cpArbiter) cpBool;
pub extern fn cpArbiterIsRemoval(arb: ?*const cpArbiter) cpBool;
pub extern fn cpArbiterGetCount(arb: ?*const cpArbiter) c_int;
pub extern fn cpArbiterGetNormal(arb: ?*const cpArbiter) cpVect;
pub extern fn cpArbiterGetPointA(arb: ?*const cpArbiter, i: c_int) cpVect;
pub extern fn cpArbiterGetPointB(arb: ?*const cpArbiter, i: c_int) cpVect;
pub extern fn cpArbiterGetDepth(arb: ?*const cpArbiter, i: c_int) cpFloat;
pub extern fn cpArbiterCallWildcardBeginA(arb: ?*cpArbiter, space: ?*cpSpace) cpBool;
pub extern fn cpArbiterCallWildcardBeginB(arb: ?*cpArbiter, space: ?*cpSpace) cpBool;
pub extern fn cpArbiterCallWildcardPreSolveA(arb: ?*cpArbiter, space: ?*cpSpace) cpBool;
pub extern fn cpArbiterCallWildcardPreSolveB(arb: ?*cpArbiter, space: ?*cpSpace) cpBool;
pub extern fn cpArbiterCallWildcardPostSolveA(arb: ?*cpArbiter, space: ?*cpSpace) void;
pub extern fn cpArbiterCallWildcardPostSolveB(arb: ?*cpArbiter, space: ?*cpSpace) void;
pub extern fn cpArbiterCallWildcardSeparateA(arb: ?*cpArbiter, space: ?*cpSpace) void;
pub extern fn cpArbiterCallWildcardSeparateB(arb: ?*cpArbiter, space: ?*cpSpace) void;
pub const cpBodyType = enum(c_uint) {
    DYNAMIC = 0,
    KINEMATIC = 1,
    STATIC = 2,
};
pub const cpBodyVelocityFunc = ?fn (?*cpBody, cpVect, cpFloat, cpFloat) callconv(.C) void;
pub const cpBodyPositionFunc = ?fn (?*cpBody, cpFloat) callconv(.C) void;
pub extern fn cpBodyAlloc() ?*cpBody;
pub extern fn cpBodyInit(body: ?*cpBody, mass: cpFloat, moment: cpFloat) ?*cpBody;
pub extern fn cpBodyNew(mass: cpFloat, moment: cpFloat) ?*cpBody;
pub extern fn cpBodyNewKinematic() ?*cpBody;
pub extern fn cpBodyNewStatic() ?*cpBody;
pub extern fn cpBodyDestroy(body: ?*cpBody) void;
pub extern fn cpBodyFree(body: ?*cpBody) void;
pub extern fn cpBodyActivate(body: ?*cpBody) void;
pub extern fn cpBodyActivateStatic(body: ?*cpBody, filter: ?*cpShape) void;
pub extern fn cpBodySleep(body: ?*cpBody) void;
pub extern fn cpBodySleepWithGroup(body: ?*cpBody, group: ?*cpBody) void;
pub extern fn cpBodyIsSleeping(body: ?*const cpBody) cpBool;
pub extern fn cpBodyGetType(body: ?*cpBody) cpBodyType;
pub extern fn cpBodySetType(body: ?*cpBody, type: cpBodyType) void;
pub extern fn cpBodyGetSpace(body: ?*const cpBody) ?*cpSpace;
pub extern fn cpBodyGetMass(body: ?*const cpBody) cpFloat;
pub extern fn cpBodySetMass(body: ?*cpBody, m: cpFloat) void;
pub extern fn cpBodyGetMoment(body: ?*const cpBody) cpFloat;
pub extern fn cpBodySetMoment(body: ?*cpBody, i: cpFloat) void;
pub extern fn cpBodyGetPosition(body: ?*const cpBody) cpVect;
pub extern fn cpBodySetPosition(body: ?*cpBody, pos: cpVect) void;
pub extern fn cpBodyGetCenterOfGravity(body: ?*const cpBody) cpVect;
pub extern fn cpBodySetCenterOfGravity(body: ?*cpBody, cog: cpVect) void;
pub extern fn cpBodyGetVelocity(body: ?*const cpBody) cpVect;
pub extern fn cpBodySetVelocity(body: ?*cpBody, velocity: cpVect) void;
pub extern fn cpBodyGetForce(body: ?*const cpBody) cpVect;
pub extern fn cpBodySetForce(body: ?*cpBody, force: cpVect) void;
pub extern fn cpBodyGetAngle(body: ?*const cpBody) cpFloat;
pub extern fn cpBodySetAngle(body: ?*cpBody, a: cpFloat) void;
pub extern fn cpBodyGetAngularVelocity(body: ?*const cpBody) cpFloat;
pub extern fn cpBodySetAngularVelocity(body: ?*cpBody, angularVelocity: cpFloat) void;
pub extern fn cpBodyGetTorque(body: ?*const cpBody) cpFloat;
pub extern fn cpBodySetTorque(body: ?*cpBody, torque: cpFloat) void;
pub extern fn cpBodyGetRotation(body: ?*const cpBody) cpVect;
pub extern fn cpBodyGetUserData(body: ?*const cpBody) cpDataPointer;
pub extern fn cpBodySetUserData(body: ?*cpBody, userData: cpDataPointer) void;
pub extern fn cpBodySetVelocityUpdateFunc(body: ?*cpBody, velocityFunc: cpBodyVelocityFunc) void;
pub extern fn cpBodySetPositionUpdateFunc(body: ?*cpBody, positionFunc: cpBodyPositionFunc) void;
pub extern fn cpBodyUpdateVelocity(body: ?*cpBody, gravity: cpVect, damping: cpFloat, dt: cpFloat) void;
pub extern fn cpBodyUpdatePosition(body: ?*cpBody, dt: cpFloat) void;
pub extern fn cpBodyLocalToWorld(body: ?*const cpBody, point: cpVect) cpVect;
pub extern fn cpBodyWorldToLocal(body: ?*const cpBody, point: cpVect) cpVect;
pub extern fn cpBodyApplyForceAtWorldPoint(body: ?*cpBody, force: cpVect, point: cpVect) void;
pub extern fn cpBodyApplyForceAtLocalPoint(body: ?*cpBody, force: cpVect, point: cpVect) void;
pub extern fn cpBodyApplyImpulseAtWorldPoint(body: ?*cpBody, impulse: cpVect, point: cpVect) void;
pub extern fn cpBodyApplyImpulseAtLocalPoint(body: ?*cpBody, impulse: cpVect, point: cpVect) void;
pub extern fn cpBodyGetVelocityAtWorldPoint(body: ?*const cpBody, point: cpVect) cpVect;
pub extern fn cpBodyGetVelocityAtLocalPoint(body: ?*const cpBody, point: cpVect) cpVect;
pub extern fn cpBodyKineticEnergy(body: ?*const cpBody) cpFloat;
pub const cpBodyShapeIteratorFunc = ?fn (?*cpBody, ?*cpShape, ?*c_void) callconv(.C) void;
pub extern fn cpBodyEachShape(body: ?*cpBody, func: cpBodyShapeIteratorFunc, data: ?*c_void) void;
pub const cpBodyConstraintIteratorFunc = ?fn (?*cpBody, ?*cpConstraint, ?*c_void) callconv(.C) void;
pub extern fn cpBodyEachConstraint(body: ?*cpBody, func: cpBodyConstraintIteratorFunc, data: ?*c_void) void;
pub const cpBodyArbiterIteratorFunc = ?fn (?*cpBody, ?*cpArbiter, ?*c_void) callconv(.C) void;
pub extern fn cpBodyEachArbiter(body: ?*cpBody, func: cpBodyArbiterIteratorFunc, data: ?*c_void) void;
const struct_cpPointQueryInfo = extern struct {
    shape: ?*const cpShape,
    point: cpVect,
    distance: cpFloat,
    gradient: cpVect,
};
pub const cpPointQueryInfo = struct_cpPointQueryInfo;
const struct_cpSegmentQueryInfo = extern struct {
    shape: ?*const cpShape,
    point: cpVect,
    normal: cpVect,
    alpha: cpFloat,
};
pub const cpSegmentQueryInfo = struct_cpSegmentQueryInfo;
const struct_cpShapeFilter = extern struct {
    group: cpGroup,
    categories: cpBitmask,
    mask: cpBitmask,
};
pub const cpShapeFilter = struct_cpShapeFilter;
pub const CP_SHAPE_FILTER_ALL: cpShapeFilter = cpShapeFilter{
    .group = @bitCast(cpGroup, @as(c_long, @as(c_int, 0))),
    .categories = ~@bitCast(cpBitmask, @as(c_int, 0)),
    .mask = ~@bitCast(cpBitmask, @as(c_int, 0)),
};
pub const CP_SHAPE_FILTER_NONE: cpShapeFilter = cpShapeFilter{
    .group = @bitCast(cpGroup, @as(c_long, @as(c_int, 0))),
    .categories = ~~@bitCast(cpBitmask, @as(c_int, 0)),
    .mask = ~~@bitCast(cpBitmask, @as(c_int, 0)),
};
pub fn cpShapeFilterNew(arg_group: cpGroup, arg_categories: cpBitmask, arg_mask: cpBitmask) cpShapeFilter {
    var group = arg_group;
    var categories = arg_categories;
    var mask = arg_mask;
    var filter: cpShapeFilter = cpShapeFilter{
        .group = group,
        .categories = categories,
        .mask = mask,
    };
    return filter;
}
pub extern fn cpShapeDestroy(shape: ?*cpShape) void;
pub extern fn cpShapeFree(shape: ?*cpShape) void;
pub extern fn cpShapeCacheBB(shape: ?*cpShape) cpBB;
pub extern fn cpShapeUpdate(shape: ?*cpShape, transform: cpTransform) cpBB;
pub extern fn cpShapePointQuery(shape: ?*const cpShape, p: cpVect, out: [*c]cpPointQueryInfo) cpFloat;
pub extern fn cpShapeSegmentQuery(shape: ?*const cpShape, a: cpVect, b: cpVect, radius: cpFloat, info: [*c]cpSegmentQueryInfo) cpBool;
pub extern fn cpShapesCollide(a: ?*const cpShape, b: ?*const cpShape) cpContactPointSet;
pub extern fn cpShapeGetSpace(shape: ?*const cpShape) ?*cpSpace;
pub extern fn cpShapeGetBody(shape: ?*const cpShape) ?*cpBody;
pub extern fn cpShapeSetBody(shape: ?*cpShape, body: ?*cpBody) void;
pub extern fn cpShapeGetMass(shape: ?*cpShape) cpFloat;
pub extern fn cpShapeSetMass(shape: ?*cpShape, mass: cpFloat) void;
pub extern fn cpShapeGetDensity(shape: ?*cpShape) cpFloat;
pub extern fn cpShapeSetDensity(shape: ?*cpShape, density: cpFloat) void;
pub extern fn cpShapeGetMoment(shape: ?*cpShape) cpFloat;
pub extern fn cpShapeGetArea(shape: ?*cpShape) cpFloat;
pub extern fn cpShapeGetCenterOfGravity(shape: ?*cpShape) cpVect;
pub extern fn cpShapeGetBB(shape: ?*const cpShape) cpBB;
pub extern fn cpShapeGetSensor(shape: ?*const cpShape) cpBool;
pub extern fn cpShapeSetSensor(shape: ?*cpShape, sensor: cpBool) void;
pub extern fn cpShapeGetElasticity(shape: ?*const cpShape) cpFloat;
pub extern fn cpShapeSetElasticity(shape: ?*cpShape, elasticity: cpFloat) void;
pub extern fn cpShapeGetFriction(shape: ?*const cpShape) cpFloat;
pub extern fn cpShapeSetFriction(shape: ?*cpShape, friction: cpFloat) void;
pub extern fn cpShapeGetSurfaceVelocity(shape: ?*const cpShape) cpVect;
pub extern fn cpShapeSetSurfaceVelocity(shape: ?*cpShape, surfaceVelocity: cpVect) void;
pub extern fn cpShapeGetUserData(shape: ?*const cpShape) cpDataPointer;
pub extern fn cpShapeSetUserData(shape: ?*cpShape, userData: cpDataPointer) void;
pub extern fn cpShapeGetCollisionType(shape: ?*const cpShape) cpCollisionType;
pub extern fn cpShapeSetCollisionType(shape: ?*cpShape, collisionType: cpCollisionType) void;
pub extern fn cpShapeGetFilter(shape: ?*const cpShape) cpShapeFilter;
pub extern fn cpShapeSetFilter(shape: ?*cpShape, filter: cpShapeFilter) void;
pub extern fn cpCircleShapeAlloc() ?*cpCircleShape;
pub extern fn cpCircleShapeInit(circle: ?*cpCircleShape, body: ?*cpBody, radius: cpFloat, offset: cpVect) ?*cpCircleShape;
pub extern fn cpCircleShapeNew(body: ?*cpBody, radius: cpFloat, offset: cpVect) ?*cpShape;
pub extern fn cpCircleShapeGetOffset(shape: ?*const cpShape) cpVect;
pub extern fn cpCircleShapeGetRadius(shape: ?*const cpShape) cpFloat;
pub extern fn cpSegmentShapeAlloc() ?*cpSegmentShape;
pub extern fn cpSegmentShapeInit(seg: ?*cpSegmentShape, body: ?*cpBody, a: cpVect, b: cpVect, radius: cpFloat) ?*cpSegmentShape;
pub extern fn cpSegmentShapeNew(body: ?*cpBody, a: cpVect, b: cpVect, radius: cpFloat) ?*cpShape;
pub extern fn cpSegmentShapeSetNeighbors(shape: ?*cpShape, prev: cpVect, next: cpVect) void;
pub extern fn cpSegmentShapeGetA(shape: ?*const cpShape) cpVect;
pub extern fn cpSegmentShapeGetB(shape: ?*const cpShape) cpVect;
pub extern fn cpSegmentShapeGetNormal(shape: ?*const cpShape) cpVect;
pub extern fn cpSegmentShapeGetRadius(shape: ?*const cpShape) cpFloat;
pub extern fn cpPolyShapeAlloc() ?*cpPolyShape;
pub extern fn cpPolyShapeInit(poly: ?*cpPolyShape, body: ?*cpBody, count: c_int, verts: [*c]const cpVect, transform: cpTransform, radius: cpFloat) ?*cpPolyShape;
pub extern fn cpPolyShapeInitRaw(poly: ?*cpPolyShape, body: ?*cpBody, count: c_int, verts: [*c]const cpVect, radius: cpFloat) ?*cpPolyShape;
pub extern fn cpPolyShapeNew(body: ?*cpBody, count: c_int, verts: [*c]const cpVect, transform: cpTransform, radius: cpFloat) ?*cpShape;
pub extern fn cpPolyShapeNewRaw(body: ?*cpBody, count: c_int, verts: [*c]const cpVect, radius: cpFloat) ?*cpShape;
pub extern fn cpBoxShapeInit(poly: ?*cpPolyShape, body: ?*cpBody, width: cpFloat, height: cpFloat, radius: cpFloat) ?*cpPolyShape;
pub extern fn cpBoxShapeInit2(poly: ?*cpPolyShape, body: ?*cpBody, box: cpBB, radius: cpFloat) ?*cpPolyShape;
pub extern fn cpBoxShapeNew(body: ?*cpBody, width: cpFloat, height: cpFloat, radius: cpFloat) ?*cpShape;
pub extern fn cpBoxShapeNew2(body: ?*cpBody, box: cpBB, radius: cpFloat) ?*cpShape;
pub extern fn cpPolyShapeGetCount(shape: ?*const cpShape) c_int;
pub extern fn cpPolyShapeGetVert(shape: ?*const cpShape, index: c_int) cpVect;
pub extern fn cpPolyShapeGetRadius(shape: ?*const cpShape) cpFloat;
pub const cpConstraintPreSolveFunc = ?fn (?*cpConstraint, ?*cpSpace) callconv(.C) void;
pub const cpConstraintPostSolveFunc = ?fn (?*cpConstraint, ?*cpSpace) callconv(.C) void;
pub extern fn cpConstraintDestroy(constraint: ?*cpConstraint) void;
pub extern fn cpConstraintFree(constraint: ?*cpConstraint) void;
pub extern fn cpConstraintGetSpace(constraint: ?*const cpConstraint) ?*cpSpace;
pub extern fn cpConstraintGetBodyA(constraint: ?*const cpConstraint) ?*cpBody;
pub extern fn cpConstraintGetBodyB(constraint: ?*const cpConstraint) ?*cpBody;
pub extern fn cpConstraintGetMaxForce(constraint: ?*const cpConstraint) cpFloat;
pub extern fn cpConstraintSetMaxForce(constraint: ?*cpConstraint, maxForce: cpFloat) void;
pub extern fn cpConstraintGetErrorBias(constraint: ?*const cpConstraint) cpFloat;
pub extern fn cpConstraintSetErrorBias(constraint: ?*cpConstraint, errorBias: cpFloat) void;
pub extern fn cpConstraintGetMaxBias(constraint: ?*const cpConstraint) cpFloat;
pub extern fn cpConstraintSetMaxBias(constraint: ?*cpConstraint, maxBias: cpFloat) void;
pub extern fn cpConstraintGetCollideBodies(constraint: ?*const cpConstraint) cpBool;
pub extern fn cpConstraintSetCollideBodies(constraint: ?*cpConstraint, collideBodies: cpBool) void;
pub extern fn cpConstraintGetPreSolveFunc(constraint: ?*const cpConstraint) cpConstraintPreSolveFunc;
pub extern fn cpConstraintSetPreSolveFunc(constraint: ?*cpConstraint, preSolveFunc: cpConstraintPreSolveFunc) void;
pub extern fn cpConstraintGetPostSolveFunc(constraint: ?*const cpConstraint) cpConstraintPostSolveFunc;
pub extern fn cpConstraintSetPostSolveFunc(constraint: ?*cpConstraint, postSolveFunc: cpConstraintPostSolveFunc) void;
pub extern fn cpConstraintGetUserData(constraint: ?*const cpConstraint) cpDataPointer;
pub extern fn cpConstraintSetUserData(constraint: ?*cpConstraint, userData: cpDataPointer) void;
pub extern fn cpConstraintGetImpulse(constraint: ?*cpConstraint) cpFloat;
pub extern fn cpConstraintIsPinJoint(constraint: ?*const cpConstraint) cpBool;
pub extern fn cpPinJointAlloc() ?*cpPinJoint;
pub extern fn cpPinJointInit(joint: ?*cpPinJoint, a: ?*cpBody, b: ?*cpBody, anchorA: cpVect, anchorB: cpVect) ?*cpPinJoint;
pub extern fn cpPinJointNew(a: ?*cpBody, b: ?*cpBody, anchorA: cpVect, anchorB: cpVect) ?*cpConstraint;
pub extern fn cpPinJointGetAnchorA(constraint: ?*const cpConstraint) cpVect;
pub extern fn cpPinJointSetAnchorA(constraint: ?*cpConstraint, anchorA: cpVect) void;
pub extern fn cpPinJointGetAnchorB(constraint: ?*const cpConstraint) cpVect;
pub extern fn cpPinJointSetAnchorB(constraint: ?*cpConstraint, anchorB: cpVect) void;
pub extern fn cpPinJointGetDist(constraint: ?*const cpConstraint) cpFloat;
pub extern fn cpPinJointSetDist(constraint: ?*cpConstraint, dist: cpFloat) void;
pub extern fn cpConstraintIsSlideJoint(constraint: ?*const cpConstraint) cpBool;
pub extern fn cpSlideJointAlloc() ?*cpSlideJoint;
pub extern fn cpSlideJointInit(joint: ?*cpSlideJoint, a: ?*cpBody, b: ?*cpBody, anchorA: cpVect, anchorB: cpVect, min: cpFloat, max: cpFloat) ?*cpSlideJoint;
pub extern fn cpSlideJointNew(a: ?*cpBody, b: ?*cpBody, anchorA: cpVect, anchorB: cpVect, min: cpFloat, max: cpFloat) ?*cpConstraint;
pub extern fn cpSlideJointGetAnchorA(constraint: ?*const cpConstraint) cpVect;
pub extern fn cpSlideJointSetAnchorA(constraint: ?*cpConstraint, anchorA: cpVect) void;
pub extern fn cpSlideJointGetAnchorB(constraint: ?*const cpConstraint) cpVect;
pub extern fn cpSlideJointSetAnchorB(constraint: ?*cpConstraint, anchorB: cpVect) void;
pub extern fn cpSlideJointGetMin(constraint: ?*const cpConstraint) cpFloat;
pub extern fn cpSlideJointSetMin(constraint: ?*cpConstraint, min: cpFloat) void;
pub extern fn cpSlideJointGetMax(constraint: ?*const cpConstraint) cpFloat;
pub extern fn cpSlideJointSetMax(constraint: ?*cpConstraint, max: cpFloat) void;
pub extern fn cpConstraintIsPivotJoint(constraint: ?*const cpConstraint) cpBool;
pub extern fn cpPivotJointAlloc() ?*cpPivotJoint;
pub extern fn cpPivotJointInit(joint: ?*cpPivotJoint, a: ?*cpBody, b: ?*cpBody, anchorA: cpVect, anchorB: cpVect) ?*cpPivotJoint;
pub extern fn cpPivotJointNew(a: ?*cpBody, b: ?*cpBody, pivot: cpVect) ?*cpConstraint;
pub extern fn cpPivotJointNew2(a: ?*cpBody, b: ?*cpBody, anchorA: cpVect, anchorB: cpVect) ?*cpConstraint;
pub extern fn cpPivotJointGetAnchorA(constraint: ?*const cpConstraint) cpVect;
pub extern fn cpPivotJointSetAnchorA(constraint: ?*cpConstraint, anchorA: cpVect) void;
pub extern fn cpPivotJointGetAnchorB(constraint: ?*const cpConstraint) cpVect;
pub extern fn cpPivotJointSetAnchorB(constraint: ?*cpConstraint, anchorB: cpVect) void;
pub extern fn cpConstraintIsGrooveJoint(constraint: ?*const cpConstraint) cpBool;
pub extern fn cpGrooveJointAlloc() ?*cpGrooveJoint;
pub extern fn cpGrooveJointInit(joint: ?*cpGrooveJoint, a: ?*cpBody, b: ?*cpBody, groove_a: cpVect, groove_b: cpVect, anchorB: cpVect) ?*cpGrooveJoint;
pub extern fn cpGrooveJointNew(a: ?*cpBody, b: ?*cpBody, groove_a: cpVect, groove_b: cpVect, anchorB: cpVect) ?*cpConstraint;
pub extern fn cpGrooveJointGetGrooveA(constraint: ?*const cpConstraint) cpVect;
pub extern fn cpGrooveJointSetGrooveA(constraint: ?*cpConstraint, grooveA: cpVect) void;
pub extern fn cpGrooveJointGetGrooveB(constraint: ?*const cpConstraint) cpVect;
pub extern fn cpGrooveJointSetGrooveB(constraint: ?*cpConstraint, grooveB: cpVect) void;
pub extern fn cpGrooveJointGetAnchorB(constraint: ?*const cpConstraint) cpVect;
pub extern fn cpGrooveJointSetAnchorB(constraint: ?*cpConstraint, anchorB: cpVect) void;
pub extern fn cpConstraintIsDampedSpring(constraint: ?*const cpConstraint) cpBool;
pub const cpDampedSpringForceFunc = ?fn (?*cpConstraint, cpFloat) callconv(.C) cpFloat;
pub extern fn cpDampedSpringAlloc() ?*cpDampedSpring;
pub extern fn cpDampedSpringInit(joint: ?*cpDampedSpring, a: ?*cpBody, b: ?*cpBody, anchorA: cpVect, anchorB: cpVect, restLength: cpFloat, stiffness: cpFloat, damping: cpFloat) ?*cpDampedSpring;
pub extern fn cpDampedSpringNew(a: ?*cpBody, b: ?*cpBody, anchorA: cpVect, anchorB: cpVect, restLength: cpFloat, stiffness: cpFloat, damping: cpFloat) ?*cpConstraint;
pub extern fn cpDampedSpringGetAnchorA(constraint: ?*const cpConstraint) cpVect;
pub extern fn cpDampedSpringSetAnchorA(constraint: ?*cpConstraint, anchorA: cpVect) void;
pub extern fn cpDampedSpringGetAnchorB(constraint: ?*const cpConstraint) cpVect;
pub extern fn cpDampedSpringSetAnchorB(constraint: ?*cpConstraint, anchorB: cpVect) void;
pub extern fn cpDampedSpringGetRestLength(constraint: ?*const cpConstraint) cpFloat;
pub extern fn cpDampedSpringSetRestLength(constraint: ?*cpConstraint, restLength: cpFloat) void;
pub extern fn cpDampedSpringGetStiffness(constraint: ?*const cpConstraint) cpFloat;
pub extern fn cpDampedSpringSetStiffness(constraint: ?*cpConstraint, stiffness: cpFloat) void;
pub extern fn cpDampedSpringGetDamping(constraint: ?*const cpConstraint) cpFloat;
pub extern fn cpDampedSpringSetDamping(constraint: ?*cpConstraint, damping: cpFloat) void;
pub extern fn cpDampedSpringGetSpringForceFunc(constraint: ?*const cpConstraint) cpDampedSpringForceFunc;
pub extern fn cpDampedSpringSetSpringForceFunc(constraint: ?*cpConstraint, springForceFunc: cpDampedSpringForceFunc) void;
pub extern fn cpConstraintIsDampedRotarySpring(constraint: ?*const cpConstraint) cpBool;
pub const cpDampedRotarySpringTorqueFunc = ?fn (?*struct_cpConstraint, cpFloat) callconv(.C) cpFloat;
pub extern fn cpDampedRotarySpringAlloc() ?*cpDampedRotarySpring;
pub extern fn cpDampedRotarySpringInit(joint: ?*cpDampedRotarySpring, a: ?*cpBody, b: ?*cpBody, restAngle: cpFloat, stiffness: cpFloat, damping: cpFloat) ?*cpDampedRotarySpring;
pub extern fn cpDampedRotarySpringNew(a: ?*cpBody, b: ?*cpBody, restAngle: cpFloat, stiffness: cpFloat, damping: cpFloat) ?*cpConstraint;
pub extern fn cpDampedRotarySpringGetRestAngle(constraint: ?*const cpConstraint) cpFloat;
pub extern fn cpDampedRotarySpringSetRestAngle(constraint: ?*cpConstraint, restAngle: cpFloat) void;
pub extern fn cpDampedRotarySpringGetStiffness(constraint: ?*const cpConstraint) cpFloat;
pub extern fn cpDampedRotarySpringSetStiffness(constraint: ?*cpConstraint, stiffness: cpFloat) void;
pub extern fn cpDampedRotarySpringGetDamping(constraint: ?*const cpConstraint) cpFloat;
pub extern fn cpDampedRotarySpringSetDamping(constraint: ?*cpConstraint, damping: cpFloat) void;
pub extern fn cpDampedRotarySpringGetSpringTorqueFunc(constraint: ?*const cpConstraint) cpDampedRotarySpringTorqueFunc;
pub extern fn cpDampedRotarySpringSetSpringTorqueFunc(constraint: ?*cpConstraint, springTorqueFunc: cpDampedRotarySpringTorqueFunc) void;
pub extern fn cpConstraintIsRotaryLimitJoint(constraint: ?*const cpConstraint) cpBool;
pub extern fn cpRotaryLimitJointAlloc() ?*cpRotaryLimitJoint;
pub extern fn cpRotaryLimitJointInit(joint: ?*cpRotaryLimitJoint, a: ?*cpBody, b: ?*cpBody, min: cpFloat, max: cpFloat) ?*cpRotaryLimitJoint;
pub extern fn cpRotaryLimitJointNew(a: ?*cpBody, b: ?*cpBody, min: cpFloat, max: cpFloat) ?*cpConstraint;
pub extern fn cpRotaryLimitJointGetMin(constraint: ?*const cpConstraint) cpFloat;
pub extern fn cpRotaryLimitJointSetMin(constraint: ?*cpConstraint, min: cpFloat) void;
pub extern fn cpRotaryLimitJointGetMax(constraint: ?*const cpConstraint) cpFloat;
pub extern fn cpRotaryLimitJointSetMax(constraint: ?*cpConstraint, max: cpFloat) void;
pub extern fn cpConstraintIsRatchetJoint(constraint: ?*const cpConstraint) cpBool;
pub extern fn cpRatchetJointAlloc() ?*cpRatchetJoint;
pub extern fn cpRatchetJointInit(joint: ?*cpRatchetJoint, a: ?*cpBody, b: ?*cpBody, phase: cpFloat, ratchet: cpFloat) ?*cpRatchetJoint;
pub extern fn cpRatchetJointNew(a: ?*cpBody, b: ?*cpBody, phase: cpFloat, ratchet: cpFloat) ?*cpConstraint;
pub extern fn cpRatchetJointGetAngle(constraint: ?*const cpConstraint) cpFloat;
pub extern fn cpRatchetJointSetAngle(constraint: ?*cpConstraint, angle: cpFloat) void;
pub extern fn cpRatchetJointGetPhase(constraint: ?*const cpConstraint) cpFloat;
pub extern fn cpRatchetJointSetPhase(constraint: ?*cpConstraint, phase: cpFloat) void;
pub extern fn cpRatchetJointGetRatchet(constraint: ?*const cpConstraint) cpFloat;
pub extern fn cpRatchetJointSetRatchet(constraint: ?*cpConstraint, ratchet: cpFloat) void;
pub extern fn cpConstraintIsGearJoint(constraint: ?*const cpConstraint) cpBool;
pub extern fn cpGearJointAlloc() ?*cpGearJoint;
pub extern fn cpGearJointInit(joint: ?*cpGearJoint, a: ?*cpBody, b: ?*cpBody, phase: cpFloat, ratio: cpFloat) ?*cpGearJoint;
pub extern fn cpGearJointNew(a: ?*cpBody, b: ?*cpBody, phase: cpFloat, ratio: cpFloat) ?*cpConstraint;
pub extern fn cpGearJointGetPhase(constraint: ?*const cpConstraint) cpFloat;
pub extern fn cpGearJointSetPhase(constraint: ?*cpConstraint, phase: cpFloat) void;
pub extern fn cpGearJointGetRatio(constraint: ?*const cpConstraint) cpFloat;
pub extern fn cpGearJointSetRatio(constraint: ?*cpConstraint, ratio: cpFloat) void;
const struct_cpSimpleMotor = opaque {};
pub const cpSimpleMotor = struct_cpSimpleMotor;
pub extern fn cpConstraintIsSimpleMotor(constraint: ?*const cpConstraint) cpBool;
pub extern fn cpSimpleMotorAlloc() ?*cpSimpleMotor;
pub extern fn cpSimpleMotorInit(joint: ?*cpSimpleMotor, a: ?*cpBody, b: ?*cpBody, rate: cpFloat) ?*cpSimpleMotor;
pub extern fn cpSimpleMotorNew(a: ?*cpBody, b: ?*cpBody, rate: cpFloat) ?*cpConstraint;
pub extern fn cpSimpleMotorGetRate(constraint: ?*const cpConstraint) cpFloat;
pub extern fn cpSimpleMotorSetRate(constraint: ?*cpConstraint, rate: cpFloat) void;
pub extern fn cpSpaceAlloc() ?*cpSpace;
pub extern fn cpSpaceInit(space: ?*cpSpace) ?*cpSpace;
pub extern fn cpSpaceNew() ?*cpSpace;
pub extern fn cpSpaceDestroy(space: ?*cpSpace) void;
pub extern fn cpSpaceFree(space: ?*cpSpace) void;
pub extern fn cpSpaceGetIterations(space: ?*const cpSpace) c_int;
pub extern fn cpSpaceSetIterations(space: ?*cpSpace, iterations: c_int) void;
pub extern fn cpSpaceGetGravity(space: ?*const cpSpace) cpVect;
pub extern fn cpSpaceSetGravity(space: ?*cpSpace, gravity: cpVect) void;
pub extern fn cpSpaceGetDamping(space: ?*const cpSpace) cpFloat;
pub extern fn cpSpaceSetDamping(space: ?*cpSpace, damping: cpFloat) void;
pub extern fn cpSpaceGetIdleSpeedThreshold(space: ?*const cpSpace) cpFloat;
pub extern fn cpSpaceSetIdleSpeedThreshold(space: ?*cpSpace, idleSpeedThreshold: cpFloat) void;
pub extern fn cpSpaceGetSleepTimeThreshold(space: ?*const cpSpace) cpFloat;
pub extern fn cpSpaceSetSleepTimeThreshold(space: ?*cpSpace, sleepTimeThreshold: cpFloat) void;
pub extern fn cpSpaceGetCollisionSlop(space: ?*const cpSpace) cpFloat;
pub extern fn cpSpaceSetCollisionSlop(space: ?*cpSpace, collisionSlop: cpFloat) void;
pub extern fn cpSpaceGetCollisionBias(space: ?*const cpSpace) cpFloat;
pub extern fn cpSpaceSetCollisionBias(space: ?*cpSpace, collisionBias: cpFloat) void;
pub extern fn cpSpaceGetCollisionPersistence(space: ?*const cpSpace) cpTimestamp;
pub extern fn cpSpaceSetCollisionPersistence(space: ?*cpSpace, collisionPersistence: cpTimestamp) void;
pub extern fn cpSpaceGetUserData(space: ?*const cpSpace) cpDataPointer;
pub extern fn cpSpaceSetUserData(space: ?*cpSpace, userData: cpDataPointer) void;
pub extern fn cpSpaceGetStaticBody(space: ?*const cpSpace) ?*cpBody;
pub extern fn cpSpaceGetCurrentTimeStep(space: ?*const cpSpace) cpFloat;
pub extern fn cpSpaceIsLocked(space: ?*cpSpace) cpBool;
pub extern fn cpSpaceAddDefaultCollisionHandler(space: ?*cpSpace) [*c]cpCollisionHandler;
pub extern fn cpSpaceAddCollisionHandler(space: ?*cpSpace, a: cpCollisionType, b: cpCollisionType) [*c]cpCollisionHandler;
pub extern fn cpSpaceAddWildcardHandler(space: ?*cpSpace, type: cpCollisionType) [*c]cpCollisionHandler;
pub extern fn cpSpaceAddShape(space: ?*cpSpace, shape: ?*cpShape) ?*cpShape;
pub extern fn cpSpaceAddBody(space: ?*cpSpace, body: ?*cpBody) ?*cpBody;
pub extern fn cpSpaceAddConstraint(space: ?*cpSpace, constraint: ?*cpConstraint) ?*cpConstraint;
pub extern fn cpSpaceRemoveShape(space: ?*cpSpace, shape: ?*cpShape) void;
pub extern fn cpSpaceRemoveBody(space: ?*cpSpace, body: ?*cpBody) void;
pub extern fn cpSpaceRemoveConstraint(space: ?*cpSpace, constraint: ?*cpConstraint) void;
pub extern fn cpSpaceContainsShape(space: ?*cpSpace, shape: ?*cpShape) cpBool;
pub extern fn cpSpaceContainsBody(space: ?*cpSpace, body: ?*cpBody) cpBool;
pub extern fn cpSpaceContainsConstraint(space: ?*cpSpace, constraint: ?*cpConstraint) cpBool;
pub const cpPostStepFunc = ?fn (?*cpSpace, ?*c_void, ?*c_void) callconv(.C) void;
pub extern fn cpSpaceAddPostStepCallback(space: ?*cpSpace, func: cpPostStepFunc, key: ?*c_void, data: ?*c_void) cpBool;
pub const cpSpacePointQueryFunc = ?fn (?*cpShape, cpVect, cpFloat, cpVect, ?*c_void) callconv(.C) void;
pub extern fn cpSpacePointQuery(space: ?*cpSpace, point: cpVect, maxDistance: cpFloat, filter: cpShapeFilter, func: cpSpacePointQueryFunc, data: ?*c_void) void;
pub extern fn cpSpacePointQueryNearest(space: ?*cpSpace, point: cpVect, maxDistance: cpFloat, filter: cpShapeFilter, out: [*c]cpPointQueryInfo) ?*cpShape;
pub const cpSpaceSegmentQueryFunc = ?fn (?*cpShape, cpVect, cpVect, cpFloat, ?*c_void) callconv(.C) void;
pub extern fn cpSpaceSegmentQuery(space: ?*cpSpace, start: cpVect, end: cpVect, radius: cpFloat, filter: cpShapeFilter, func: cpSpaceSegmentQueryFunc, data: ?*c_void) void;
pub extern fn cpSpaceSegmentQueryFirst(space: ?*cpSpace, start: cpVect, end: cpVect, radius: cpFloat, filter: cpShapeFilter, out: [*c]cpSegmentQueryInfo) ?*cpShape;
pub const cpSpaceBBQueryFunc = ?fn (?*cpShape, ?*c_void) callconv(.C) void;
pub extern fn cpSpaceBBQuery(space: ?*cpSpace, bb: cpBB, filter: cpShapeFilter, func: cpSpaceBBQueryFunc, data: ?*c_void) void;
pub const cpSpaceShapeQueryFunc = ?fn (?*cpShape, [*c]cpContactPointSet, ?*c_void) callconv(.C) void;
pub extern fn cpSpaceShapeQuery(space: ?*cpSpace, shape: ?*cpShape, func: cpSpaceShapeQueryFunc, data: ?*c_void) cpBool;
pub const cpSpaceBodyIteratorFunc = ?fn (?*cpBody, ?*c_void) callconv(.C) void;
pub extern fn cpSpaceEachBody(space: ?*cpSpace, func: cpSpaceBodyIteratorFunc, data: ?*c_void) void;
pub const cpSpaceShapeIteratorFunc = ?fn (?*cpShape, ?*c_void) callconv(.C) void;
pub extern fn cpSpaceEachShape(space: ?*cpSpace, func: cpSpaceShapeIteratorFunc, data: ?*c_void) void;
pub const cpSpaceConstraintIteratorFunc = ?fn (?*cpConstraint, ?*c_void) callconv(.C) void;
pub extern fn cpSpaceEachConstraint(space: ?*cpSpace, func: cpSpaceConstraintIteratorFunc, data: ?*c_void) void;
pub extern fn cpSpaceReindexStatic(space: ?*cpSpace) void;
pub extern fn cpSpaceReindexShape(space: ?*cpSpace, shape: ?*cpShape) void;
pub extern fn cpSpaceReindexShapesForBody(space: ?*cpSpace, body: ?*cpBody) void;
pub extern fn cpSpaceUseSpatialHash(space: ?*cpSpace, dim: cpFloat, count: c_int) void;
pub extern fn cpSpaceStep(space: ?*cpSpace, dt: cpFloat) void;
const struct_cpSpaceDebugColor = extern struct {
    r: f32,
    g: f32,
    b: f32,
    a: f32,
};
pub const cpSpaceDebugColor = struct_cpSpaceDebugColor;
pub const cpSpaceDebugDrawCircleImpl = ?fn (cpVect, cpFloat, cpFloat, cpSpaceDebugColor, cpSpaceDebugColor, cpDataPointer) callconv(.C) void;
pub const cpSpaceDebugDrawSegmentImpl = ?fn (cpVect, cpVect, cpSpaceDebugColor, cpDataPointer) callconv(.C) void;
pub const cpSpaceDebugDrawFatSegmentImpl = ?fn (cpVect, cpVect, cpFloat, cpSpaceDebugColor, cpSpaceDebugColor, cpDataPointer) callconv(.C) void;
pub const cpSpaceDebugDrawPolygonImpl = ?fn (c_int, [*c]const cpVect, cpFloat, cpSpaceDebugColor, cpSpaceDebugColor, cpDataPointer) callconv(.C) void;
pub const cpSpaceDebugDrawDotImpl = ?fn (cpFloat, cpVect, cpSpaceDebugColor, cpDataPointer) callconv(.C) void;
pub const cpSpaceDebugDrawColorForShapeImpl = ?fn (?*cpShape, cpDataPointer) callconv(.C) cpSpaceDebugColor;
pub const cpSpaceDebugDrawFlags = enum(c_uint) {
    SHAPES = 1,
    CONSTRAINTS = 2,
    COLLISION_POINTS = 4,
};
const struct_cpSpaceDebugDrawOptions = extern struct {
    drawCircle: cpSpaceDebugDrawCircleImpl,
    drawSegment: cpSpaceDebugDrawSegmentImpl,
    drawFatSegment: cpSpaceDebugDrawFatSegmentImpl,
    drawPolygon: cpSpaceDebugDrawPolygonImpl,
    drawDot: cpSpaceDebugDrawDotImpl,
    flags: cpSpaceDebugDrawFlags,
    shapeOutlineColor: cpSpaceDebugColor,
    colorForShape: cpSpaceDebugDrawColorForShapeImpl,
    constraintColor: cpSpaceDebugColor,
    collisionPointColor: cpSpaceDebugColor,
    data: cpDataPointer,
};
pub const cpSpaceDebugDrawOptions = struct_cpSpaceDebugDrawOptions;
pub extern fn cpSpaceDebugDraw(space: ?*cpSpace, options: [*c]cpSpaceDebugDrawOptions) void;
extern var cpVersionString: [*c]const u8;
pub extern fn cpMomentForCircle(m: cpFloat, r1: cpFloat, r2: cpFloat, offset: cpVect) cpFloat;
pub extern fn cpAreaForCircle(r1: cpFloat, r2: cpFloat) cpFloat;
pub extern fn cpMomentForSegment(m: cpFloat, a: cpVect, b: cpVect, radius: cpFloat) cpFloat;
pub extern fn cpAreaForSegment(a: cpVect, b: cpVect, radius: cpFloat) cpFloat;
pub extern fn cpMomentForPoly(m: cpFloat, count: c_int, verts: [*c]const cpVect, offset: cpVect, radius: cpFloat) cpFloat;
pub extern fn cpAreaForPoly(count: c_int, verts: [*c]const cpVect, radius: cpFloat) cpFloat;
pub extern fn cpCentroidForPoly(count: c_int, verts: [*c]const cpVect) cpVect;
pub extern fn cpMomentForBox(m: cpFloat, width: cpFloat, height: cpFloat) cpFloat;
pub extern fn cpMomentForBox2(m: cpFloat, box: cpBB) cpFloat;
pub extern fn cpConvexHull(count: c_int, verts: [*c]const cpVect, result: [*c]cpVect, first: [*c]c_int, tol: cpFloat) c_int;
pub fn cpClosetPointOnSegment(p: cpVect, a: cpVect, b: cpVect) cpVect {
    var delta: cpVect = cpvsub(a, b);
    var t: cpFloat = cpfclamp01(cpvdot(delta, cpvsub(p, b)) / cpvlengthsq(delta));
    return cpvadd(b, cpvmult(delta, t));
}

pub const CP_USE_DOUBLES = @as(c_int, 1);
pub const cpfsqrt = sqrt;
pub const cpfsin = sin;
pub const cpfcos = cos;
pub const cpfacos = acos;
pub const cpfatan2 = atan2;
pub const cpfmod = fmod;
pub const cpfexp = exp;
pub const cpfpow = pow;
pub const cpffloor = floor;
pub const cpfceil = ceil;
pub const CPFLOAT_MIN = DBL_MIN;
pub const CP_PI = @import("std").zig.c_translation.cast(cpFloat, 3.14159265358979323846264338327950288);
pub const cpTrue = @as(c_int, 1);
pub const cpFalse = @as(c_int, 0);
pub const CP_NO_GROUP = @import("std").zig.c_translation.cast(cpGroup, @as(c_int, 0));
pub const CP_ALL_CATEGORIES = ~@import("std").zig.c_translation.cast(cpBitmask, @as(c_int, 0));
pub const CP_WILDCARD_COLLISION_TYPE = ~@import("std").zig.c_translation.cast(cpCollisionType, @as(c_int, 0));
pub const CP_BUFFER_BYTES = @as(c_int, 32) * @as(c_int, 1024);
pub const cpcalloc = calloc;
pub const cprealloc = realloc;
pub const cpfree = free;
pub const CP_MAX_CONTACTS_PER_ARBITER = @as(c_int, 2);
pub const CP_VERSION_MAJOR = @as(c_int, 7);
pub const CP_VERSION_MINOR = @as(c_int, 0);
pub const CP_VERSION_RELEASE = @as(c_int, 3);
