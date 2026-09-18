public static class SimpleCalculator
{
    public static string Calculate(int operand1, int operand2, string? operation)
    {
        if (operand2 == 0 && operation == "/")
        {
            return "Division by zero is not allowed.";
        }
        
        return operation switch
        {
            "-" => $"{operand1} - {operand2} = {operand1 - operand2}",
            "+" => $"{operand1} + {operand2} = {operand1 + operand2}",
            "*" => $"{operand1} * {operand2} = {operand1 * operand2}",
            "/" => $"{operand1} / {operand2} = {operand1 / operand2}",
            null => throw new ArgumentNullException(nameof(operation)),
            "" => throw new ArgumentException("Operation cannot be empty.", nameof(operation)),
            _ => throw new ArgumentOutOfRangeException()
        };
    }
}
