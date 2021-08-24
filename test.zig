pub const MaterialMapIndex = enum(c_int) {
    ALBEDO = 0,
    METALNESS = 1,
    NORMAL = 2,
    ROUGHNESS = 3,
    OCCLUSION = 4,
    EMISSION = 5,
    HEIGHT = 6,
    BRDG = 7,
    CUBEMAP = 8,
    IRRADIANCE = 9,
    PREFILTER = 10,
    _,

    pub const DIFFUSE = @This().ALBEDO;
    pub const SPECULAR = @This().METALNESS;
};
pub fn main() void {
    const p = MaterialMapIndex.DIFFUSE;
    @import("std").log.info("{}", .{p});
}