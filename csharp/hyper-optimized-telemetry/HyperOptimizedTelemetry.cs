using System.Collections;

public static class TelemetryBuffer
{
    public static byte[] ToBuffer(long reading)
    {
        var buffer = new byte[9];

        var (prefix, payload) = reading switch
        {
            >= 0 and <= ushort.MaxValue => (0x2,  BitConverter.GetBytes((ushort)reading)),
            >= short.MinValue and < 0   => (0xfe, BitConverter.GetBytes((short)reading)),
            >= int.MinValue and < short.MinValue => (0xfc, BitConverter.GetBytes((int)reading)),
            > ushort.MaxValue and <= int.MaxValue => (0xfc, BitConverter.GetBytes((int)reading)),
            > int.MaxValue and <= uint.MaxValue => (0x4, BitConverter.GetBytes((uint)reading)),
            _ => (0xf8, BitConverter.GetBytes(reading)),
        };

        buffer[0] = (byte) prefix;
        payload.CopyTo(buffer, 1);

        return buffer;
    }

    public static long FromBuffer(byte[] buffer) => buffer[0] switch
        {
            0xfe => BitConverter.ToInt16(buffer, 1),
            0x2 => BitConverter.ToUInt16(buffer, 1),
            0xfc => BitConverter.ToInt32(buffer, 1),
            0x4 => BitConverter.ToUInt32(buffer, 1),
            0xf8 => BitConverter.ToInt64(buffer, 1),
            _ => 0
        };
}
