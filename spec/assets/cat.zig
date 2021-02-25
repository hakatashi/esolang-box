const std = @import("std");
const io = std.io;

pub fn main() !void {
  const stdout = io.getStdOut();
  try stdout.writeFileAll(io.getStdIn(), .{});
}
