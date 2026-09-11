using System.Globalization;

static class Appointment
{
    public static DateTime Schedule(string appointmentDateDescription) => DateTime.Parse(appointmentDateDescription);

    public static bool HasPassed(DateTime appointmentDate) => DateTime.Now > appointmentDate;

    public static bool IsAfternoonAppointment(DateTime appointmentDate) => appointmentDate.Hour is >= 12 and < 18;

    public static string Description(DateTime appointmentDate) =>
        // return $"You have an appointment on {appointmentDate.Month}/{appointmentDate.Day}/{appointmentDate.Year} {appointmentDate.Hour}:{appointmentDate.Minute}:{appointmentDate.Second} PM.";
        $"You have an appointment on {appointmentDate.ToString(new CultureInfo("en-US"))}.";

    public static DateTime AnniversaryDate() => new(DateTime.Now.Year, 9, 15);
}
