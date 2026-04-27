const std = @import("std");

pub fn main(init: std.process.Init) !void {
    const io = init.io;

    const stdin = std.Io.File.stdin();
    const stdout = std.Io.File.stdout();

    var buf: [4096]u8 = undefined;
    const bufs = [_][]u8{buf[0..]};

    while (true) {
        const n = stdin.readStreaming(io, &bufs) catch |err| switch (err) {
            error.EndOfStream => break,
            else => return err,
        };

        try stdout.writeStreamingAll(io, buf[0..n]);
    }
}